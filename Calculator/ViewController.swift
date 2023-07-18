import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var calculator = Calculator()
    var touchDigit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touch(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        print("Touched \(digit) digit")
        
        if digit == "0" && display.text == "0" {
            // 숫자가 0이고 현재 표시된 값도 0일 경우 무시
            return
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
        guard let operatorValue = sender.currentTitle else { return }
        print("Touched operator: \(operatorValue)")

        if let displayText = display.text,
           let displayValue = Double(displayText) {
            calculator.saveOperand(displayValue)
        }
        
        calculator.saveOpration(operatorValue)
        calculator.calculate()
        
        let result = calculator.displayValue
        
        if result.truncatingRemainder(dividingBy: 1) == 0 {
                // 결과 값이 정수인 경우
                display.text = String(format: "%.0f", result)
            } else {
                // 결과 값이 소수인 경우
                display.text = String(format: "%.1f", result)
            }
        touchDigit = false
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        calculator.clear()
        touchDigit = false
    }
}
