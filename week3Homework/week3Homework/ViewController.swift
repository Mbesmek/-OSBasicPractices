//
//  ViewController.swift
//  week3Homework
//
//  Created by Melih Bugra Esmek on 17.09.2021.
//

import UIKit

class ViewController: UIViewController {

    private var isTyping: Bool = false
    private var previousNumber : Double = 0.0
    private let mathOperation = MathOperations()
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        let digit = String(sender.tag)
        let displayText = resultLabel.text ?? ""

        
        if isTyping {
            resultLabel.text = displayText + digit
        } else {
            resultLabel.text = digit
            isTyping.toggle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func actionButtonTapped(_ sender: UIButton) {
        let value = NSString(string: resultLabel.text ?? "0").doubleValue
        resultLabel.text = String(sqrt(value))
        
        switch sender.tag {
        case 15:
            switch mathOperation.selectedOperation {
            case .divide:
                resultLabel.text = mathOperation.Divide(firstNumber: previousNumber, secondNumber: value)
            case .multiply:
                resultLabel.text = mathOperation.Multiply(firstNumber: previousNumber, secondNumber: value)
            case .sub:
                resultLabel.text = mathOperation.Sub(firstNumber: previousNumber, secondNumber: value)
            case .sum:
                resultLabel.text = mathOperation.Sum(firstNumber: previousNumber, secondNumber: value)
            default:
                resultLabel.text = "Try Again"
            }
        case 11:
            previousNumber = value
            mathOperation.setOperation(operation: "Divide")
            resultLabel.text = ""
        case 12:
            previousNumber = value
            mathOperation.setOperation(operation: "Multiply")
            resultLabel.text = ""
        case 13:
            previousNumber = value
            mathOperation.setOperation(operation: "Sub")
            resultLabel.text = ""
        case 14:
            previousNumber = value
            mathOperation.setOperation(operation: "Sum")
            resultLabel.text = ""
        
        case 10:
            previousNumber = 0
            resultLabel.text = ""
        default:
            resultLabel.text = "Eror"
            
        }
        
//        if label.text != "" && sender.tag != 10 && sender.tag != 15{
//            if sender.tag == 11{
//                label.text = "/"
//
//            }else if sender.tag == 12 {
//                label.text = "X"
//
//            }else if sender.tag == 13 {
//                label.text = "-"
//
//            }else if sender.tag == 14 {
//                label.text = "+"
//            }
//            operation = sender.tag
//            perfomingMath = true;
//        }
//        if  sender.tag == 15 {
//            if sender.tag == 11{
//                label.text = String(previousNumber / numberOnScreen)
//
//            }else if sender.tag == 12 {
//                label.text = String(previousNumber * numberOnScreen)
//
//            }else if sender.tag == 13 {
//                label.text = String(previousNumber - numberOnScreen)
//
//            }else if sender.tag == 14 {
//                 label.text = String(previousNumber + numberOnScreen)
//            }
//        }
//        else if sender.tag == 11
        
    }
}

