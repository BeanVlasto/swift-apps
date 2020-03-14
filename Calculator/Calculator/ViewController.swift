//
//  ViewController.swift
//  Calculator
//
//  Created by Vlasto, Benedict (JDN) on 14/03/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numA: Double = 0.0
    var numB: Double = 0.0
    var modifier: String = ""
    
    @IBOutlet var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func compute(string: String, command: String) -> String {
        let numbers = string.components(separatedBy: command)
        if let numA = Double(numbers[0]), let numB = Double(numbers[1]) {
            if command == "+" {
                let result = numA + numB
                return String(result)
            } else if command == "-" {
                let result = numA - numB
                return String(result)
            } else if command == "*" {
                let result = numA * numB
                return String(result)
            } else if command == "/" {
                let result = numA / numB
                return String(result)
            }
        }
        return "Failed to compute"
    }
    
    @IBAction func b0(_ sender: Any) {
        output.text! += "0"
    }
    
    @IBAction func b1(_ sender: Any) {
        output.text! += "1"
    }

    @IBAction func b2(_ sender: Any) {
        output.text! += "2"
    }
    
    @IBAction func b3(_ sender: Any) {
        output.text! += "3"
    }
    
    @IBAction func b4(_ sender: Any) {
        output.text! += "4"
    }
    
    @IBAction func b5(_ sender: Any) {
        output.text! += "5"
    }
    
    @IBAction func b6(_ sender: Any) {
        output.text! += "6"
    }
    
    @IBAction func b7(_ sender: Any) {
        output.text! += "7"
    }
    
    @IBAction func b8(_ sender: Any) {
        output.text! += "8"
    }
    
    @IBAction func b9(_ sender: Any) {
        output.text! += "9"
    }
    
    @IBAction func plus(_ sender: Any) {
        modifier = "+"
        output.text! += "+"
    }
    
    @IBAction func minus(_ sender: Any) {
        modifier = "-"
        output.text! += "-"
    }
    
    @IBAction func multiply(_ sender: Any) {
        modifier = "*"
        output.text! += "*"
    }
    
    @IBAction func divide(_ sender: Any) {
        modifier = "/"
        output.text! += "/"
    }
    
    @IBAction func equals(_ sender: Any) {
        output.text = compute(string: output.text!, command: modifier)
    }
    
    @IBAction func clear(_ sender: Any) {
        output.text = ""
        numA = 0.0
        numB = 0.0
    }
    
}

