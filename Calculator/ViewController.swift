import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!

    var firstNumber: Double?
    var operatorSymbol: String?
    var touchDigit = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touch(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        print("Touched \(digit) digit")
        
        if digit == "0" && display.text == "0" {
            return
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
            firstNumber = number
            operatorSymbol = symbol
            touchDigit = false
        }
    }

    @IBAction func resultTouched(_ sender: UIButton) {
        if let number = Double(display.text!),
           let symbol = operatorSymbol,
           let result = calculate(firstNumber: firstNumber, operatorSymbol: symbol, secondNumber: number) {
            display.text = String(result)
            firstNumber = result
            touchDigit = false
        }
    }
    
    func calculate(firstNumber: Double?, operatorSymbol: String, secondNumber: Double) -> Double? {
        guard let fn = firstNumber else {
            return nil
        }
        
        switch operatorSymbol {
        case "+":
            return fn + secondNumber
        case "-":
            return fn - secondNumber
        case "×":
            return fn * secondNumber
        case "÷":
            if secondNumber != 0 {
                return fn / secondNumber
            } else {
                print("ERROR: Division by zero")
                return nil
            }
        default:
            print("ERROR")
            return nil
            
        }
    }


    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        firstNumber = nil
        operatorSymbol = nil
        touchDigit = false
    }
    
}
