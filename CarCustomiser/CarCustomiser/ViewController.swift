//
//  ViewController.swift
//  CarCustomiser
//
//  Created by Vlasto, Benedict (JDN) on 11/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carStatistics: UILabel!
    
    var car = Car(make: "BMW", model: "i8", topSpeed: 200, acceleration: 4.3, handling: 7)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carStatistics.text = car.displayStats()
    }


}

