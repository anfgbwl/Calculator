import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var firstNumber: Double? // 입력값(숫자)
    var operatorSymbol: String? // 연산자
    var touchDigit = false // 숫자 터치 여부
    
    let calculator = Calculator() // Calculator 인스턴스 생성

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
        if let number = Double(display.text!),
           let symbol = sender.currentTitle {
            firstNumber = number
            operatorSymbol = symbol
            touchDigit = false
            print("Touched \(symbol) digit")

        }
    }
    
    @IBAction func resultTouched(_ sender: UIButton) {
        if let number = Double(display.text!),
           let result = calculator.calculate(with: number) {
            display.text = String(result)
            firstNumber = result
            touchDigit = false
            print("Result button tapped")
        } else {
            // `calculate` 메서드에서 `nil`을 반환한 경우에 대한 처리
            print("Calculation failed.")
        }
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        firstNumber = nil
        operatorSymbol = nil
        touchDigit = false
    }
}
