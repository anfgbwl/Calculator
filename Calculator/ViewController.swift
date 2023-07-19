import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var display: UILabel!

    var num1: Double?
    var operatorSymbol: String?
    var touchDigit = false
    var calculator: Calculator = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touch(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        print("Touched \(digit) digit")
        
        if digit == "0" || digit == "00" {
            guard display.text != "0" else { return }
//            guard문으로 대체 가능(지향)
//            if display.text == "0" { return }
        }
        
        if digit == "." {
            // 이미 "."이 텍스트에 포함되어 있는 경우 입력을 무시
            if let text = display.text, text.contains(".") {
                return
            }
        }
        
        if touchDigit {
            if display.text == "0" {
                display.text = digit
            } else {
                display.text?.append(digit)
            }
        } else {
            display.text = digit
            touchDigit = true
        }
        
    }
    
    @IBAction func operatorTouched(_ sender: UIButton) {
        guard let symbol = sender.currentTitle else { return }
        print("Touched operator: \(symbol)")
        
        if let number = Double(display.text!) {
            num1 = number
            operatorSymbol = symbol
            touchDigit = false
        }
    }

    @IBAction func resultTouched(_ sender: UIButton) {
        if let number = Double(display.text!),
           let symbol = operatorSymbol {
           let result = calculator.calculate(num1 ?? 0, number, operatorSymbol: symbol)
            let isDecimal = result.truncatingRemainder(dividingBy: 1) != 0
            
            if isDecimal {
                display.text = String(result)
            } else {
                display.text = String(Int(result))
            }
            num1 = result
            touchDigit = false
        }
    }

    @IBAction func percent(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        
        if digit == "0" && display.text == "0" {
            return
        }
        
        if touchDigit {
            if display.text == "0" {
                display.text = digit
            } else if let currentNumber = Double(display.text ?? "") {
                let percentValue = currentNumber * 0.01
                display.text = String(percentValue)
            }
        } else {
            touchDigit = false
        }
    }
    
    @IBAction func plusMinus(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        
        if digit == "0" && display.text == "0" {
            return
        }
        
        if touchDigit {
            if display.text == "0" {
                display.text = digit
            } else if let currentNumber = Double(display.text ?? "") {
                let plusMinusValue = currentNumber * -1
                
                let isDecimal = plusMinusValue.truncatingRemainder(dividingBy: 1) != 0
                
                if isDecimal {
                    touchDigit = false
                } else {
                    display.text = String(Int(plusMinusValue))
                }
            }
        }
    }
            
            
            
            @IBAction func clear(_ sender: UIButton) {
                display.text = "0"
                num1 = nil
                operatorSymbol = nil
                touchDigit = false
            }
            
        }
