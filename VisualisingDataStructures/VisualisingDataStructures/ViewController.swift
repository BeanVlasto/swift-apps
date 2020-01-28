//
//  ViewController.swift
//  VisualisingDataStructures
//
//  Created by Vlasto, Benedict (JDN) on 27/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stack = Stack()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushButton(_ sender: Any) {
        stack.push(item: "some data")
    }
    
    @IBAction func popButton(_ sender: Any) {
        stack.pop()
    }
    

}

