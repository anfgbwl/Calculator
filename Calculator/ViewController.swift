import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!

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
        guard let operatorValue = sender.currentTitle else { return }
        print("Touched operator: \(operatorValue)")
        
        let calculrator = Calculator()
        calculrator.setOperation(operatorValue)
        
        if let operandValue = Double(display.text ?? "") {
            calculrator.setOperand(operandValue)
        }
        
        if let result = calculrator.result {
            display.text = String(result)

        }
       
    }

//    @IBAction func resultTouched(_ sender: UIButton) {
//
//    }
//
//
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        touchDigit = false
    }
}
