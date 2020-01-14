//
//  ViewController.swift
//  TamagotchiApp
//
//  Created by Vlasto, Benedict (JDN) on 14/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayStartingStats: UILabel!
    
    let tamagotchi = Tamagotchi()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayStartingStats.text = tamagotchi.displayStats()
    }
    
    @IBAction func feed(_ sender: Any) {
        tamagotchi.feed()
    }
    
}
