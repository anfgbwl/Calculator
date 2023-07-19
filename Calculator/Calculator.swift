class Calculator {
    
    /*  기존 코드(사칙연산)
     
    func calculate(num1: Double?, operatorSymbol: String, num2: Double) -> Double? {
        guard let fn = num1 else {
            return nil
        }
     
     switch operatorSymbol {
     case "+":
         return fn + num2
     case "-":
         return fn - num2
     case "×":
         return fn * num2
     case "÷":
         if num2 != 0 {
             return fn / num2
         } else {
             print("ERROR: Division by zero")
             return nil
         }
     case "%%":
         return fn.truncatingRemainder(dividingBy: num2)
     default:
         print("ERROR")
         return nil
         
         }
     
     */
    
    private let addOperation = AddOperation()
    private let substractOperation = SubstractOperation()
    private let multiplyOperation = MultiplyOperation()
    private let divideOperation = DivideOperation()
        
    func calculate(_ num1: Double, _ num2: Double, operatorSymbol: String) -> Double {
        switch operatorSymbol {
        case "+":
            return addOperation.calculate(num1, num2)
        case "-":
            return substractOperation.calculate(num1, num2)
        case "×":
            return multiplyOperation.calculate(num1, num2)
        case "÷":
            return divideOperation.calculate(num1, num2)
        case "%%":
            return num1.truncatingRemainder(dividingBy: num2)
        default:
            print("ERROR")
            return 0
        }
    }
    
}


class AddOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double {
        return num1 + num2
    }
}

class SubstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double {
        return num1 - num2
    }
}

class MultiplyOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double {
        return num1 * num2
    }
}

class DivideOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double {
        guard num2 != 0 else {
            print("ERROR: Division by zero")
            return 0
        }
        return num1 / num2
    }
}
