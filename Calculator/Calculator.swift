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
    
    private let addOperation: AbstractOperation = AddOperation()
    private let substractOperation: AbstractOperation = SubstractOperation()
    private let multiplyOperation: AbstractOperation = MultiplyOperation()
    private let divideOperation: AbstractOperation = DivideOperation()
        
    func calculate(_ num1: Double, _ num2: Double, operatorSymbol: String) -> Double {
        switch operatorSymbol {
        case "×":
            return multiplyOperation.calculate(num1, num2)
        case "÷":
            return divideOperation.calculate(num1, num2)
        case "%%":
            return num1.truncatingRemainder(dividingBy: num2)
        case "+":
            return addOperation.calculate(num1, num2)
        case "-":
            return substractOperation.calculate(num1, num2)
        default:
            print("ERROR")
            return 0
        }
    }
}

class AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double {
        fatalError("ERROR: Need to modify Operation class")
    }
}

class AddOperation: AbstractOperation {
    override func calculate(_ num1: Double, _ num2: Double) -> Double {
        return num1 + num2
    }
}

class SubstractOperation: AbstractOperation {
    override func calculate(_ num1: Double, _ num2: Double) -> Double {
        return num1 - num2
    }
}

class MultiplyOperation: AbstractOperation {
    override func calculate(_ num1: Double, _ num2: Double) -> Double {
        return num1 * num2
    }
}

class DivideOperation: AbstractOperation {
    override func calculate(_ num1: Double, _ num2: Double) -> Double {
        guard num2 != 0 else {
            print("ERROR: Division by zero")
            return 0
        }
        return num1 / num2
    }
}
