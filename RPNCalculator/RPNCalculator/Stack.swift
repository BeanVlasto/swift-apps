//
//  Stack.swift
//  RPNCalculator
//
//  Created by Vlasto, Benedict (JDN) on 08/06/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class Stack {
    
    var stack: [Int] = []
    
    func pop() -> Int? {
        return stack.popLast()
    }
    
    func push(data: Int) {
        stack.append(data)
    }
    
    func peek() -> Int? {
        return stack.last
    }
    
}
