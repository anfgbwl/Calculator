import Foundation

class Calculator {
    
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
    
}
