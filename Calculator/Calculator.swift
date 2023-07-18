//
//  Calculator.swift
//  Calculator
//
//  Created by t2023-m0076 on 2023/07/18.
//

import Foundation

class Calculator {
    
    var operand: Double?
    var opration: String?
    var displayValue: Double = 0

    
    func saveOperand(_ operand: Double) {
        self.operand = operand
    }
    
    func saveOpration(_ opration: String) {
        self.opration = opration
    }
    
    func calculate() -> Void {
        guard let operand = operand,
              let opration = opration else {
            return
        }
        
        switch opration {
        case "+" :
            displayValue += operand
        case "-" :
            displayValue -= operand
        case "×" :
            displayValue *= operand
        case "÷" :
            guard operand != 0 else {
                print("Error: Division by zero")
                return
            }
            displayValue /= operand
        default :
            return
        }
        
        self.operand = nil
        self.opration = nil
    }
    
    func clear() {
        displayValue = 0
        operand = nil
        opration = nil
    }
    
}
