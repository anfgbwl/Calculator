import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!

    var num1: Double?
    var operatorSymbol: String?
    var touchDigit = false
    var calculator: Calculator = Calculator()
    var lastResult: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func touch(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        print("Touched \(digit) digit")
        
        if digit == "0" || digit == "00" {
            guard display.text != "0" else { return }
        }
        
        if digit == ".", let text = display.text, text.contains(".") { return }
        
        if touchDigit {
            display.text?.append(digit)
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
            display.text = isDecimal ? String(result) : String(Int(result))
            num1 = result
            touchDigit = false
        }
    }

    
    @IBAction func percent(_ sender: UIButton) {
        if var number = Double(display.text ?? ""), number != 0 {
            number *= 0.01
            display.text = String(number)
        }
    }
    
    
    @IBAction func plusMinus(_ sender: UIButton) {
        if var number = Double(display.text ?? ""), number != 0 {
            number *= -1
            display.text = number.truncatingRemainder(dividingBy: 1) != 0 ? String(number) : String(Int(number))
        }
    }
            
            
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        num1 = nil
        lastResult = nil
        operatorSymbol = nil
        touchDigit = false
    }
}
