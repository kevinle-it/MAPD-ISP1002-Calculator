//
//  ViewController.swift
//  Calculator
//
//  Created by A00249054 - Minh Tri Le on 2/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operator: String {
        case Add
        case Subtract
        case Multiply
        case Divide
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "0"
    }
    
    var leftOperand: Double?
    var rightOperand: Double?
    var op: Operator? = .none
    @IBOutlet weak var resultLabel: UILabel!
    var shouldResetResultLabel = true

    // Decimal point
    @IBAction func btnDot(_ sender: Any) {
        if shouldResetResultLabel {
            resultLabel.text = "0"
            shouldResetResultLabel = false
        }
        if !resultLabel.text!.contains(".") {
            resultLabel.text = resultLabel.text! + "."
        }
    }
    // Number buttons
    @IBAction func btn0(_ sender: Any) {
        pressNumber(num: "0")
    }
    @IBAction func btn1(_ sender: Any) {
        pressNumber(num: "1")
    }
    @IBAction func btn2(_ sender: Any) {
        pressNumber(num: "2")
    }
    @IBAction func btn3(_ sender: Any) {
        pressNumber(num: "3")
    }
    @IBAction func btn4(_ sender: Any) {
        pressNumber(num: "4")
    }
    @IBAction func btn5(_ sender: Any) {
        pressNumber(num: "5")
    }
    @IBAction func btn6(_ sender: Any) {
        pressNumber(num: "6")
    }
    @IBAction func btn7(_ sender: Any) {
        pressNumber(num: "7")
    }
    @IBAction func btn8(_ sender: Any) {
        pressNumber(num: "8")
    }
    @IBAction func btn9(_ sender: Any) {
        pressNumber(num: "9")
    }

    // Run when user press equal button
    @IBAction func btnEqual(_ sender: Any) {
        showResult()
        shouldResetResultLabel = true
    }
    // Operators +, -, x, ÷
    @IBAction func btnAdd(_ sender: Any) {
        pressOperator(opr: Operator.Add)
    }
    @IBAction func btnSubtract(_ sender: Any) {
        pressOperator(opr: Operator.Subtract)
    }
    @IBAction func btnMultiply(_ sender: Any) {
        pressOperator(opr: Operator.Multiply)
    }
    @IBAction func btnDivide(_ sender: Any) {
        pressOperator(opr: Operator.Divide)
    }
    
    // Reset to initial state
    @IBAction func btnClear(_ sender: Any) {
        leftOperand = nil
        rightOperand = nil
        op = .none
        resultLabel.text = "0"
        shouldResetResultLabel = true
    }
    // Change sign of number
    @IBAction func btnSign(_ sender: Any) {
        let tempDouble = Double(resultLabel.text!)!
        if tempDouble >= 0 {
            resultLabel.text = "-" + resultLabel.text!
        } else {
            resultLabel.text = resultLabel.text!.replacingOccurrences(of: "-", with: "")
        }
        setOperand()
    }
    // Log base 10
    @IBAction func btnLog(_ sender: Any) {
        var num = Double(resultLabel.text!)
        num = log(num!)/log(10.0)
        resultLabel.text = String(num!)
        setOperand()

        shouldResetResultLabel = true
    }

    // Trigonometric functions
    @IBAction func btnSin(_ sender: Any) {
        let num = Double(resultLabel.text!)
        let sinus = sin(num! * Double.pi / 180)
        resultLabel.text = String(sinus)
        setOperand()

        shouldResetResultLabel = true
    }
    @IBAction func btnCos(_ sender: Any) {
        let num = Double(resultLabel.text!)
        let cosinus = cos(num! * Double.pi / 180)
        resultLabel.text = String(cosinus)
        setOperand()

        shouldResetResultLabel = true
    }
    @IBAction func btnTan(_ sender: Any) {
        let num = Double(resultLabel.text!)
        let tangent = tan(num! * Double.pi / 180)
        resultLabel.text = String(tangent)
        setOperand()

        shouldResetResultLabel = true
    }

    // Exponent of 2
    @IBAction func btnExp2(_ sender: Any) {
        var num = Double(resultLabel.text!)
        num = pow(num!, 2)
        resultLabel.text = String(num!)
        setOperand()

        shouldResetResultLabel = true
    }
    // Exponent of 3
    @IBAction func btnExp3(_ sender: Any) {
        var num = Double(resultLabel.text!)
        num = pow(num!, 3)
        resultLabel.text = String(num!)
        setOperand()

        shouldResetResultLabel = true
    }

    // Square root
    @IBAction func btnSqrt(_ sender: Any) {
        var num = Double(resultLabel.text!)
        num = num!.squareRoot()
        resultLabel.text = String(num!)
        setOperand()

        shouldResetResultLabel = true
    }
    // Cube root
    @IBAction func btnCube(_ sender: Any) {
        var num = Double(resultLabel.text!)
        num = pow(num!, 1.0/3.0)
        resultLabel.text = String(num!)
        setOperand()

        shouldResetResultLabel = true
    }
    
    // Run when user press numbers
    func pressNumber(num: String) {
        if shouldResetResultLabel || resultLabel.text == "0" {
            resultLabel.text = ""
            shouldResetResultLabel = false
        }
        resultLabel.text = resultLabel.text! + num
        
        if leftOperand != nil {
            rightOperand = Double(resultLabel.text!)
        }
    }

    // Run when user press +, -, x, ÷
    func pressOperator(opr: Operator) {
        if leftOperand == nil {
            leftOperand = Double(resultLabel.text!)
        }
        if rightOperand != nil {
            showResult()
        }
        op = opr
        shouldResetResultLabel = true
    }
    
    // Remove trailing zeros after decimal point
    func getStringToShow(num: Double) -> String {
        return String(
            num.truncatingRemainder(dividingBy: 1) == 0
                ? String(format: "%.0f", num)
                : String(num)
        )
    }
    
    // Show final result from 2 operands and an operator equation
    func showResult() {
        var resultNum: Double = 0

        if leftOperand != nil && rightOperand != nil && op != nil {
            switch op {
            case .Add:
                resultNum = leftOperand! + rightOperand!
            case .Subtract:
                resultNum = leftOperand! - rightOperand!
            case .Multiply:
                resultNum = leftOperand! * rightOperand!
            case .Divide:
                resultNum = leftOperand! / rightOperand!
            case .none:
                resultNum = 0
            }
            resultLabel.text = getStringToShow(num: resultNum)
        } else {
            // User press equal button right after pressing numbers (without using an operator)
            resultLabel.text = getStringToShow(num: Double(resultLabel.text!)!)
        }
        leftOperand = Double(resultLabel.text!)
        rightOperand = nil
    }
    
    func setOperand() {
        if rightOperand != nil {
            rightOperand = Double(resultLabel.text!)
        } else {
            leftOperand = Double(resultLabel.text!)
        }
    }
}

