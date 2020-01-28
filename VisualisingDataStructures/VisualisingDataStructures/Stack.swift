//
//  Stack.swift
//  VisualisingDataStructures
//
//  Created by Kochhar, Anish (EJNR) on 27/01/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import Foundation


class Stack {
    
    var top = -1
    var array = [Int]()
    let max_length = 10
    
    func push(item: Int) {
        if top  == 9 {
            print("stack overflow")
        }
        else {
            top += 1
            print(top)
            array.append(item)
        }
    }
    
    func pop() -> Int? {
        if top < 0 {
            print("stack empty")
            return nil
        }
        else {
            let item = array[top]
            top -= 1
            return item
        }
        
    }
    
    func peek() -> Int? {
        if top < 0 {
            print("stack empty")
            return nil
        } else {
            return array[top]
        }
    }
    
    func display() -> ([Int], Int) {
        return (array, top)
    }
}
