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

print("""
\(tamagotchi.getName) says hello!
What would you like to do with your tamagotchi?
    1) Ask how old it is
    2) Weigh it
    3) Feed
    4) Put to bed
    5) Clean
""")
