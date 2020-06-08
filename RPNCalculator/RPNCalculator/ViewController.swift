//
//  ViewController.swift
//  RPNCalculator
//
//  Created by Vlasto, Benedict (JDN) on 08/06/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let stack = Stack()
        stack.push(data: 24)
        stack.push(data: 3)
        stack.push(data: 15)
        print(String(stack.pop()!))
        stack.all()
    }


}

