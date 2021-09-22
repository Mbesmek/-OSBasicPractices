//
//  MathOperations.swift
//  week3Homework
//
//  Created by Melih Bugra Esmek on 18.09.2021.
//

import Foundation

class MathOperations {
    
    var selectedOperation : operationType?
    
    func Sum(firstNumber: Double , secondNumber: Double) -> String {
        return String(firstNumber + secondNumber)
    }
    
    func Sub(firstNumber: Double , secondNumber: Double) -> String {
        return String(firstNumber - secondNumber)
    }
    
    func Divide(firstNumber: Double , secondNumber: Double) -> String {
        return String(firstNumber / secondNumber)
    }
    
    func Multiply(firstNumber: Double , secondNumber: Double) -> String {
        return String(firstNumber * secondNumber)
    }
    
    enum operationType {
        case sum,sub,divide,multiply
    }
    
    func setOperation(operation: String) -> Void{
        
        switch operation {
        case "Sum":
            selectedOperation = .sum
        case "Sub":
            selectedOperation = .sub
        case "Divide":
            selectedOperation = .divide
        case "Multiply":
            selectedOperation = .multiply
        default:
            selectedOperation = nil
        }
        
    }
    
}
