//
//  ViewController.swift
//  Calculator
//
//  Created by A00249054 - Minh Tri Le on 2/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func btnDot(_ sender: Any) {
        print(".")
    }
    @IBAction func btn0(_ sender: Any) {
        print("0")
    }
    @IBAction func btn1(_ sender: Any) {
        print("1")
    }
    @IBAction func btn2(_ sender: Any) {
        print("2")
    }
    @IBAction func btn3(_ sender: Any) {
        print("3")
    }
    @IBAction func btn4(_ sender: Any) {
        print("4")
    }
    @IBAction func btn5(_ sender: Any) {
        print("5")
    }
    @IBAction func btn6(_ sender: Any) {
        print("6")
    }
    @IBAction func btn7(_ sender: Any) {
        print("7")
    }
    @IBAction func btn8(_ sender: Any) {
        print("8")
    }
    @IBAction func btn9(_ sender: Any) {
        print("9")
    }
    
    @IBAction func btnEqual(_ sender: Any) {
        print("=")
    }
    @IBAction func btnAdd(_ sender: Any) {
        print("+")
    }
    @IBAction func btnSubtract(_ sender: Any) {
        print("-")
    }
    @IBAction func btnMultiply(_ sender: Any) {
        print("x")
    }
    @IBAction func btnDivide(_ sender: Any) {
        print("÷")
    }
    
    @IBAction func btnClear(_ sender: Any) {
        print("C")
    }
    @IBAction func btnSign(_ sender: Any) {
        print("+/-")
    }
    @IBAction func btnLog(_ sender: Any) {
        print("log")
    }
    
    @IBAction func btnSin(_ sender: Any) {
        print("sin")
    }
    @IBAction func btnCos(_ sender: Any) {
        print("cos")
    }
    @IBAction func btnTan(_ sender: Any) {
        print("tan")
    }
    
    @IBAction func btnExp2(_ sender: Any) {
        print("^2")
    }
    @IBAction func btnExp3(_ sender: Any) {
        print("^3")
    }
    @IBAction func btnSqrt(_ sender: Any) {
        print("sqrt")
    }
    @IBAction func btnCube(_ sender: Any) {
        print("cube")
    }
}

