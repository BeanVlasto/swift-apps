//
//  ViewController.swift
//  TamagotchiApp
//
//  Created by Vlasto, Benedict (JDN) on 14/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayStats: UILabel!
    @IBOutlet var ageDisplay: UILabel!
    @IBOutlet var gameTimerDisplay: UILabel!
    @IBOutlet var gameDisplay: UILabel!
    @IBOutlet var leftButtonDisplay: UIButton!
    @IBOutlet var rightButtonDisplay: UIButton!
    @IBOutlet var feedMealDisplay: UIButton!
    @IBOutlet var feedSnackDisplay: UIButton!
    @IBOutlet var playGameDisplay: UIButton!
    @IBOutlet var pooButtonDisplay: UIButton!
    
    let tamagotchi = Tamagotchi()
    
    var leftOrRight: Int = 0
    var timePassed = 0
    var agingTimer: Timer?
    var gameTimer: Timer?
    var gameTimeRemaining = 3
    var needsCleaning = false
    var dead = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pooButtonDisplay.isHidden = true
        pooButtonDisplay.isEnabled = false
        gameTimerDisplay.isHidden = true
        gameDisplay.isHidden = true
        leftButtonDisplay.isEnabled = false
        rightButtonDisplay.isEnabled = false
        updateDisplay()
        agingTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeTimePass), userInfo: nil, repeats: true)
    }
    
    func updateDisplay() {
        if dead {
            displayStats.text = "Your tamagotchi died :I"
        } else {
            displayStats.text = tamagotchi.displayStats()
            ageDisplay.text = "Age: \(tamagotchi.age)"
            gameTimerDisplay.text = "\(gameTimeRemaining)"
        }
    }
    
    func endGame() {
        leftButtonDisplay.isEnabled = false
        rightButtonDisplay.isEnabled = false
        gameTimerDisplay.isHidden = true
        gameDisplay.isHidden = true
        gameTimer?.invalidate()
    }
    
    func goesToBathroom() {
        pooButtonDisplay.isHidden = false
        pooButtonDisplay.isEnabled = true
        needsCleaning = true
    }
    
    func killTamagotchi() {
        displayStats.text = "Your tamagotchi died :I"
        dead = true
        agingTimer?.invalidate()
        feedMealDisplay.isEnabled = false
        feedSnackDisplay.isEnabled = false
        playGameDisplay.isEnabled = false
        pooButtonDisplay.isHidden = true
        pooButtonDisplay.isEnabled = false
        gameTimerDisplay.isHidden = true
        gameDisplay.isHidden = true
        leftButtonDisplay.isEnabled = false
        rightButtonDisplay.isEnabled = false
    }
    
    @IBAction func pooButton(_ sender: Any) {
        needsCleaning = false
        pooButtonDisplay.isHidden = true
        pooButtonDisplay.isEnabled = false
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
        gameTimeRemaining = 3
        gameTimerDisplay.text = "\(gameTimeRemaining)"
        gameTimerDisplay.isHidden = false
        leftButtonDisplay.isEnabled = true
        rightButtonDisplay.isEnabled = true
        leftOrRight = Int.random(in: 0 ... 1)
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decreaseGameTimer), userInfo: nil, repeats: true)
        gameDisplay.isHidden = false
        if leftOrRight == 0 {
            gameDisplay.text = "<--"
        } else {
            gameDisplay.text = "-->"
        }
    }
    
    @IBAction func leftButton(_ sender: Any) {
        if leftOrRight == 0 {
            gameDisplay.text = "Correct! Tamagotchi is happier!"
            if tamagotchi.happiness <= 3 {
                tamagotchi.happiness += 1
            }
        } else {
            gameDisplay.text = "Wrong, your Tamagotchi is sad."
            if tamagotchi.happiness >= 1 {
                tamagotchi.happiness -= 1
            }
        }
        leftButtonDisplay.isEnabled = false
        rightButtonDisplay.isEnabled = false
        displayStats.text = tamagotchi.displayStats()
    }
    
    @IBAction func rightButton(_ sender: Any) {
        if leftOrRight == 1 {
            gameDisplay.text = "Correct! Tamagotchi is happier!"
            if tamagotchi.happiness <= 3 {
                tamagotchi.happiness += 1
            }
        } else {
            gameDisplay.text = "Wrong, your Tamagotchi is sad."
            if tamagotchi.happiness >= 1 {
                tamagotchi.happiness -= 1
            }
        }
        leftButtonDisplay.isEnabled = false
        rightButtonDisplay.isEnabled = false
        displayStats.text = tamagotchi.displayStats()
    }
    
    @objc func makeTimePass() {
        timePassed += 1
        if tamagotchi.weight < 1 {
            killTamagotchi()
        }
        if timePassed % 5 == 0 {
            //Feeding
            if tamagotchi.fullness > 2 {
                tamagotchi.weight += tamagotchi.fullness - 2
            } else if tamagotchi.fullness < 2 {
                tamagotchi.weight -= 2 - tamagotchi.fullness
            }
            
            //Cleaning (health)
            if tamagotchi.isSick {
                if tamagotchi.health == 0 {
                    //dies
                } else {
                    tamagotchi.health -= 10
                }
            }
            
            //Bathroom
            if needsCleaning {
                killTamagotchi()
            } else {
                let randomBathroomNumber = Int.random(in: 1 ... 4)
                if randomBathroomNumber == 1 {
                    goesToBathroom()
                }
            }
            
            updateDisplay()
        }
        if timePassed % 10 == 0 {
            tamagotchi.age += 1
            if tamagotchi.fullness > 0.5 {
                tamagotchi.fullness -= 1
            } else if tamagotchi.fullness == 0.5 {
                tamagotchi.fullness = 0
            }
            updateDisplay()
        }
    }
    
    @objc func decreaseGameTimer() {
        gameTimeRemaining -= 1
        if gameTimeRemaining <= 0 {
            endGame()
        } else {
            updateDisplay()
        }
    }
    
}
