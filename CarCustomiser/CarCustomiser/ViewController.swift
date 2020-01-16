//
//  ViewController.swift
//  CarCustomiser
//
//  Created by Vlasto, Benedict (JDN) on 11/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    @IBOutlet var tiresPackage: UISwitch!
    @IBOutlet var spoilerPackage: UISwitch!
    @IBOutlet var gearboxPackage: UISwitch!
    @IBOutlet var remainingFundsLabel: UILabel!
    @IBOutlet var carStatistics: UILabel!
    @IBOutlet var remainingTimeDisplay: UILabel!
    @IBOutlet var nextCar: UIButton!
    
    var timeRemaining = 30
    var remainingFunds = 0 {
        didSet {
            remainingFundsLabel.text = "Remaining funds: \(remainingFunds)"
            disableUnavailablePackages()
        }
    }
    
    var starterCars = StarterCars()
    var currentIndex = 0
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }
    
    var timer: Timer? {
        didSet {
            countdown()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[currentIndex]
        carStatistics.text = car?.displayStats()
        remainingFunds = 1000
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    func resetDisplay() {
        engineAndExhaustPackage.isOn = false
        tiresPackage.isOn = false
        spoilerPackage.isOn = false
        gearboxPackage.isOn = false
        remainingFunds = 1000
    }
    
    @IBAction func nextCar(_ sender: Any) {
        currentIndex += 1
        if currentIndex >= starterCars.cars.count {
            currentIndex = 0
        }
        car = starterCars.cars[currentIndex]
        resetDisplay()
    }
    
    func disableUnavailablePackages() {
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
    
    func disableEverything() {
        engineAndExhaustPackage.isEnabled = false
        tiresPackage.isEnabled = false
        spoilerPackage.isEnabled = false
        gearboxPackage.isEnabled = false
        nextCar.isEnabled = false
    }
    
    @objc func countdown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            remainingTimeDisplay.text = "\(timeRemaining)"
        } else {
            timer?.invalidate()
            disableEverything()
        }
    }
    
}

