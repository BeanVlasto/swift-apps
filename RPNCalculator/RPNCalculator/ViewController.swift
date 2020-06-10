//
//  ViewController.swift
//  RPNCalculator
//
//  Created by Vlasto, Benedict (JDN) on 08/06/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var display: UILabel!
    
    var input_num: Int? = nil
    
    let stack = Stack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func addToStack(number: Int?) {
        if number != nil {
            stack.push(data: number!)
        }
    }
    
    func addNumberToStack() {
        if input_num != nil {
            addToStack(number: input_num!)
        }
        input_num = nil
    }
    
    func digitEntered(digit: String) {
        if input_num == nil {
            input_num = Int(digit)
            display.text! += digit
        } else if String(input_num!).count > 2 {
            invalidNumberAlert()
        } else {
            display.text! += digit
            input_num = Int(String(input_num!) + digit)
        }
    }
    
    func returnNumbersForCalculation() -> [Int]? {
        if stack.array.count > 1 {
            let num_2 = stack.pop()! // When subtracting (or dividing), the first thing to be popped should be subtracted from the second, hence "num_2" is popped first.
            let num_1 = stack.pop()!
            return [num_1, num_2]
        } else {
            invalidCalculationAlert()
            let endOfString = display.text!.firstIndex(of: " ")!
            display.text! = String(display.text![...endOfString])
            return nil
        }
    }
    
    func invalidCalculationAlert() {
        let alert = UIAlertController(title: "Invalid calculation", message: "Two numbers are required per operation", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func invalidNumberAlert() {
        let alert = UIAlertController(title: "Invalid number", message: "Numbers must be 3 digits or less", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func add() {
        if let num_array = returnNumbersForCalculation() {
            let result = num_array[0] + num_array[1]
            stack.push(data: result)
        }
    }
    
    func subtract() {
        if let num_array = returnNumbersForCalculation() {
            let result = num_array[0] - num_array[1]
            stack.push(data: result)
        }
    }
    
    func multiply() {
        if let num_array = returnNumbersForCalculation() {
            let result = num_array[0] * num_array[1]
            stack.push(data: result)
        }
    }
    
    func divide() {
        if let num_array = returnNumbersForCalculation() {
            let result = num_array[0] / num_array[1]
            stack.push(data: result)
        }
    }
    
    
    @IBAction func zero(_ sender: Any) {
        digitEntered(digit: "0")
    }
    
    @IBAction func one(_ sender: Any) {
        digitEntered(digit: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        digitEntered(digit: "2")
    }
    
    @IBAction func three(_ sender: Any) {
        digitEntered(digit: "3")
    }
    
    @IBAction func four(_ sender: Any) {
        digitEntered(digit: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        digitEntered(digit: "5")
    }
    
    @IBAction func six(_ sender: Any) {
        digitEntered(digit: "6")
    }
    
    @IBAction func seven(_ sender: Any) {
        digitEntered(digit: "7")
    }
    
    @IBAction func eight(_ sender: Any) {
        digitEntered(digit: "8")
    }
    
    @IBAction func nine(_ sender: Any) {
        digitEntered(digit: "9")
    }
    
    @IBAction func eval(_ sender: Any) {
        if stack.isEmpty() == false {
            display.text! = String(stack.peek()!)
            display.text! += " "
        }
    }
    
    @IBAction func clear(_ sender: Any?) {
        display.text! = ""
        stack.empty()
        input_num = nil
    }
    
    @IBAction func enter(_ sender: Any) {
        addNumberToStack()
        display.text! += " "
    }
    
    @IBAction func changeSign(_ sender: Any) {
        if input_num != nil {
            input_num = -1 * input_num!
        }
    }
    
    @IBAction func plus(_ sender: Any) {
        display.text! += " + "
        addNumberToStack()
        add()
    }
    
    @IBAction func minus(_ sender: Any) {
        display.text! += " - "
        addNumberToStack()
        subtract()
    }
    
    @IBAction func times(_ sender: Any) {
        display.text! += " * "
        addNumberToStack()
        multiply()
    }
    
    @IBAction func divide(_ sender: Any) {
        display.text! += " / "
        addNumberToStack()
        divide()
    }
    
}
