//
//  main.swift
//  Tamagotchi
//
//  Created by Vlasto, Benedict (JDN) on 26/11/2019.
//  Copyright © 2019 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation



print("What would you like to call your Tamagotchi? ")
var name = ""
if let input = readLine() {
    name = input
}

let tamagotchi = Tamagotchi(name: name)

name = tamagotchi.getName()
print("""
\(name) says hello!
What would you like to do with your tamagotchi?
    1) Ask how old it is
    2) Weigh it
    3) Feed
    4) Put to bed
    5) Clean
    6) Kill
""")

if let input = readLine() {
    if let numberInput = Int(input) {
        switch numberInput {
        case 1:
            print(tamagotchi.getAge())
        case 2:
            print(tamagotchi.getWeight())
        case 3:
            tamagotchi.feed()
            print("""
                Your tamagotchi got happier! It also put on some weight.
                Happiness: \(tamagotchi.getHappiness())
                Weight: \(tamagotchi.getWeight())
                """)
        case 6:
            tamagotchi.kill()
        default:
            print("Whatever")
        }
    }
}
