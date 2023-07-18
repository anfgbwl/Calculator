import Foundation

class Calculator {
//    var firstNumber: Double?
//    var secondNumber: Double?
    var operand: Double?
    var operation: String?
    var viewController: ViewController?
    // ViewController 인스턴스에 대한 참조
    var displayValue: Double = 0
    
    func setOperand(_ operand: Double) {
        self.operand = operand
    }
    
    func setOperation(_ operation: String) {
        self.operation = operation
    }
    
    func setDisplayValue(_ value: Double) {
        viewController?.display.text = String(value)
    }
    
    var result: Double? {
        guard let operation = operation, let operand = operand else {
            return nil
        }
        switch operation {
        case "+":
            return operand + displayValue
        case "-":
            return operand - displayValue
        case "×":
            return operand * displayValue
        case "÷":
            guard displayValue != 0 else {
                print("ERROR: 0으로는 나눌 수 없습니다.")
                return nil
            }
            return operand / displayValue
        default:
            return nil
        }

    }
    
}
