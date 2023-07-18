class Calculator {
    private var firstNumber: Double?
    private var operatorSymbol: String?
    
    func setOperand(_ operand: Double) {
        firstNumber = operand
    }
    
    func setOperator(_ operatorSymbol: String) {
        self.operatorSymbol = operatorSymbol
    }
    
    func calculate(with secendNumber: Double) -> Double? {
        guard let firstNumber = firstNumber,
            let operatorSymbol = operatorSymbol else {
            return nil
        }
        
        switch operatorSymbol {
        case "+":
            return firstNumber + secendNumber
        case "-":
            return firstNumber - secendNumber
        case "×":
            return firstNumber * secendNumber
        case "÷":
            if secendNumber != 0 {
                return firstNumber / secendNumber
            } else {
                print("오류: 0으로 나눌 수 없습니다.")
                return nil
            }
        default:
            print("오류: 잘못된 연산자입니다.")
            return nil
        }
    }
    
    func reset() {
        firstNumber = nil
        operatorSymbol = nil
    }
}
