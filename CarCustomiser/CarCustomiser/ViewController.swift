//
//  ViewController.swift
//  CarCustomiser
//
//  Created by Vlasto, Benedict (JDN) on 11/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var engineAndExhaustPackage: UISwitch!
    @IBOutlet weak var tiresPackage: UISwitch!
    @IBOutlet weak var spoilerPackage: UISwitch!
    @IBOutlet weak var gearboxPackage: UISwitch!
    @IBOutlet weak var remainingFundsLabel: UILabel!
    @IBOutlet weak var carStatistics: UILabel!
    
    var remainingFunds = 0 {
        didSet {
            remainingFundsLabel.text = "Remaining funds: \(remainingFunds)"
            
            if remainingFunds < 500 && engineAndExhaustPackage.isOn == false {
                engineAndExhaustPackage.isEnabled = false
            } else {
                engineAndExhaustPackage.isEnabled = true
            }
            
            if remainingFunds < 500 && tiresPackage.isOn == false {
                tiresPackage.isEnabled = false
            } else {
                tiresPackage.isEnabled = true
            }
            
            if remainingFunds < 200 && spoilerPackage.isOn == false {
                spoilerPackage.isEnabled = false
            } else {
                spoilerPackage.isEnabled = true
            }
            
            if remainingFunds < 420 && gearboxPackage.isOn == false {
                gearboxPackage.isEnabled = false
            } else {
                gearboxPackage.isEnabled = true
            }
            
        }
    }
    
    var starterCars = StarterCars()
    var currentIndex = 0
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[currentIndex]
        carStatistics.text = car?.displayStats()
        remainingFunds = 1000
    }
    
    @IBAction func nextCar(_ sender: Any) {
        currentIndex += 1
        if currentIndex >= starterCars.cars.count {
            currentIndex = 0
        }
        car = starterCars.cars[currentIndex]
        engineAndExhaustPackage.isOn = false
        tiresPackage.isOn = false
        spoilerPackage.isOn = false
        gearboxPackage.isOn = false
        remainingFunds = 1000
    }
    
    @IBAction func engineAndExhaustPackageToggle(_ sender: Any) {
        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 5
            remainingFunds += 500
        }
    }
    
    @IBAction func tiresPackageToggle(_ sender: Any) {
        if tiresPackage.isOn {
            car?.handling += 1
            car?.acceleration -= 0.1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            car?.acceleration += 0.1
            remainingFunds += 500
        }
    }
    
    @IBAction func spoilerPackageToggle(_ sender: Any) {
        if spoilerPackage.isOn {
            car?.handling += 1
            remainingFunds -= 200
        } else {
            car?.handling -= 1
            remainingFunds += 200
        }
    }
    
    @IBAction func gearboxPackageToggle(_ sender: Any) {
        if gearboxPackage.isOn {
            car?.acceleration -= 0.4
            remainingFunds -= 420
        } else {
            car?.acceleration += 0.4
            remainingFunds += 420
        }
    }
    
    
}

