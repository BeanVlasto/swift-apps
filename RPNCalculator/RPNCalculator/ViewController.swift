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
    
    var number: String = ""
    let stack = Stack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func addToStack(number: String) {
        if number != "" {
            stack.push(data: Int(number)!)
        }
    }
    
    func add() {
        if stack.array.count > 1 {
            let num_1 = stack.pop()!
            let num_2 = stack.pop()!
            let result = num_1 + num_2
            stack.push(data: result)
        } else {
            display.text! = "Invalid equation"
            // self.clear(nil)
        }
    }
    
    func subtract() {
        if stack.array.count > 1 {
            let num_1 = stack.pop()!
            let num_2 = stack.pop()!
            let result = num_2 - num_1
            stack.push(data: result)
        }
    }
    
    func multiply() {
        if stack.array.count > 1 {
            let num_1 = stack.pop()!
            let num_2 = stack.pop()!
            let result = num_1 * num_2
            stack.push(data: result)
        }
    }
    
    func divide() {
        if stack.array.count > 1 {
            let num_1 = stack.pop()!
            let num_2 = stack.pop()!
            let result = Int(num_2 / num_1)
            stack.push(data: result)
        }
    }
    
    
    @IBAction func zero(_ sender: Any) {
        display.text! += "0"
        number += "0"
    }
    
    @IBAction func one(_ sender: Any) {
        display.text! += "1"
        number += "1"
    }
    
    @IBAction func two(_ sender: Any) {
        display.text! += "2"
        number += "2"
    }
    
    @IBAction func three(_ sender: Any) {
        display.text! += "3"
        number += "3"
    }
    
    @IBAction func four(_ sender: Any) {
        display.text! += "4"
        number += "4"
    }
    
    @IBAction func five(_ sender: Any) {
        display.text! += "5"
        number += "5"
    }
    
    @IBAction func six(_ sender: Any) {
        display.text! += "6"
        number += "6"
    }
    
    @IBAction func seven(_ sender: Any) {
        display.text! += "7"
        number += "7"
    }
    
    @IBAction func eight(_ sender: Any) {
        display.text! += "8"
        number += "8"
    }
    
    @IBAction func nine(_ sender: Any) {
        display.text! += "9"
        number += "9"
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
        number = ""
    }
    
    @IBAction func enter(_ sender: Any) {
        addToStack(number: number)
        number = ""
        display.text! += " "
    }
    
    @IBAction func plus(_ sender: Any) {
        display.text! += " + "
        addToStack(number: number)
        number = ""
        add()
    }
    
    @IBAction func minus(_ sender: Any) {
        display.text! += " - "
        addToStack(number: number)
        number = ""
        subtract()
    }
    
    @IBAction func times(_ sender: Any) {
        display.text! += " * "
        addToStack(number: number)
        number = ""
        multiply()
    }
    
    @IBAction func divide(_ sender: Any) {
        display.text! += " / "
        addToStack(number: number)
        number = ""
        divide()
    }
    
}

