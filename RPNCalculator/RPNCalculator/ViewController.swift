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
    var stored_output: String = ""
    let stack = Stack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Adds number to the stack and resets number that user is inputting
    func addNumberToStack() {
        if input_num != nil {
            stack.push(data: input_num!)
        }
        input_num = nil
    }
    
    // Called each time digit is entered. If number is too long, returns true, if it's ok returns false
    func invalidNumberCheck(string: String) -> Bool {
        var string = string
        string.removeAll(where: { "-".contains($0) })
        if string.count > 2 {
            return true
        }
        return false
    }
    
    // Called every time digit is entered. If number being entered is too long, shows alert. If it's ok, adds number
    func digitEntered(digit: String) {
        if input_num == nil {
            input_num = Int(digit)
            display.text! += digit
        } else if invalidNumberCheck(string: String(input_num!)) {
            invalidNumberAlert()
        } else {
            display.text! += digit
            input_num = Int(String(input_num!) + digit)
        }
    }
    
    // Checks if stack has two numbers for a calculation. If yes, return them, if not, call "invalidCalculation"
    func returnNumbersForCalculation() -> [Int]? {
        if stack.array.count > 1 {
            let num_2 = stack.pop()! // When subtracting (or dividing), the first thing to be popped should be subtracted from the second, hence "num_2" is popped first.
            let num_1 = stack.pop()!
            return [num_1, num_2]
        } else {
            invalidCalculation()
            return nil
        }
    }
    
    // Displays alert to user that calculation is invalid and removes the operator entered from the display
    func invalidCalculation() {
        invalidCalculationAlert()
        let endOfString = display.text!.firstIndex(of: " ")!
        display.text! = String(display.text![...endOfString])
    }
    
    // Alerts for different errors
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
    
    func zeroAlert() {
        let alert = UIAlertController(title: "Ya done goofed", message: "Oop!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "I'm a clown", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    // Buttons to take user input
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
    
    // If stack contains at least one number, display top of stack
    @IBAction func eval(_ sender: Any) {
        if stack.isEmpty() == false {
            display.text! = String(stack.peek()!) + " "
            stored_output = display.text!
        }
    }
    
    @IBAction func clearButton(_ sender: Any?) {
        clear()
    }
    
    func clear() {
        display.text! = ""
        stored_output = ""
        stack.empty()
        input_num = nil
    }
    
    // Adds current number to stack and resets number user is inputting
    @IBAction func enter(_ sender: Any) {
        addNumberToStack()
        display.text! += " "
        stored_output = display.text!
    }
    
    @IBAction func changeSign(_ sender: Any) {
        if input_num != nil {
            input_num = -1 * input_num!
            display.text! = stored_output + String(input_num!)
        }
    }
    
    @IBAction func plus(_ sender: Any) {
        display.text! += " + "
        addNumberToStack()
        plus()
    }
    
    func plus() {
        if let num_array = returnNumbersForCalculation() {
            let result = num_array[0] + num_array[1]
            stack.push(data: result)
        }
    }
    
    @IBAction func minus(_ sender: Any) {
        display.text! += " - "
        addNumberToStack()
        minus()
    }
    
    func minus() {
        if let num_array = returnNumbersForCalculation() {
            let result = num_array[0] - num_array[1]
            stack.push(data: result)
        }
    }
    
    @IBAction func times(_ sender: Any) {
        display.text! += " * "
        addNumberToStack()
        times()
    }
    
    func times() {
        if let num_array = returnNumbersForCalculation() {
            let result = num_array[0] * num_array[1]
            stack.push(data: result)
        }
    }
    
    @IBAction func divide(_ sender: Any) {
        display.text! += " / "
        addNumberToStack()
        divide()
    }
    
    func divide() {
        if let num_array = returnNumbersForCalculation() {
            if num_array[1] != 0 {
                let result = num_array[0] / num_array[1]
                stack.push(data: result)
            } else {
                zeroAlert()
                clear()
            }
        }
    }
    
}
