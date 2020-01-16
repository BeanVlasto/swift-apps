//
//  ViewController.swift
//  TamagotchiApp
//
//  Created by Vlasto, Benedict (JDN) on 14/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayStartingStats: UILabel!
    @IBOutlet var ageDisplay: UILabel!
    @IBOutlet var gameDisplay: UILabel!
    @IBOutlet var leftButtonDisplay: UIButton!
    @IBOutlet var rightButtonDisplay: UIButton!
    
    let tamagotchi = Tamagotchi()
    
    var leftOrRight: Int?
    var age = 0
    var timePassed = 0
    var agingTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameDisplay.isHidden = true
        leftButtonDisplay.isEnabled = false
        rightButtonDisplay.isEnabled = false
        updateDisplay()
        agingTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(increaseAge), userInfo: nil, repeats: true)
    }
    
    func updateDisplay() {
        displayStartingStats.text = tamagotchi.displayStats()
        ageDisplay.text = "Age: \(age)"
    }
    
    @IBAction func feedMeal(_ sender: Any) {
        tamagotchi.feed(type: "meal")
        updateDisplay()
    }
    
    @IBAction func feedSnack(_ sender: Any) {
        tamagotchi.feed(type: "snack")
        updateDisplay()
    }
    
    @IBAction func playGame(_ sender: Any) {
        leftButtonDisplay.isEnabled = true
        rightButtonDisplay.isEnabled = true
        leftOrRight? = Int.random(in: 0 ... 1)
    }
    
    @IBAction func leftButton(_ sender: Any) {
        if leftOrRight? == 0 {
            gameDisplay.text = "Correct! Tamagotchi is happier!"
        }
    }
    
    @IBAction func rightButton(_ sender: Any) {
    }
    
    @objc func increaseAge() {
        timePassed += 1
        if timePassed % 10 == 0 {
            age += 1
            updateDisplay()
        }
    }
    
}
