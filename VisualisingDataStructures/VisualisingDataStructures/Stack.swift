//
//  Stack.swift
//  VisualisingDataStructures
//
//  Created by Vlasto, Benedict (JDN) on 27/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class Stack {
    
    var top: Int = -1
    var stackArray: [String] = []
    
    func push(item: String) {
        stackArray.append(item)
        top += 1
    }
    
    func pop() -> String? {
        if top == -1 {
            print("Can't be done, stack empty.")
            return nil
        } else {
            top -= 1
            return stackArray[top + 1]
        }
    }
    
    func peek() -> String? {
        if top == -1 {
            print("Can't be done, stack empty.")
            return nil
        } else {
            return stackArray[top]
        }
    }
    
    func display() -> [String]? {
        if top == -1 {
            print("Can't be done, stack empty.")
            return nil
        } else {
            for i in 0 ..< stackArray.count {
                print(stackArray[i])
            }
            return stackArray
        }
    }
}
