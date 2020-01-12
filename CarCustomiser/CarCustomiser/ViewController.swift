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
    
    var starterCars = StarterCars()
    var currentIndex = 0
    var car: Car? {
        didSet(newCar) {
            carStatistics.text = newCar?.displayStats()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[currentIndex]
        carStatistics.text = car?.displayStats()
    }
    
    @IBAction func nextCar(_ sender: Any) {
        currentIndex += 1
        if currentIndex >= starterCars.cars.count {
            currentIndex = 0
        }
        car = starterCars.cars[currentIndex]
    }
    

}

