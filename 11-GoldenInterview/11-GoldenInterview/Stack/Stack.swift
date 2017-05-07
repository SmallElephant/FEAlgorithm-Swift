//
//  Stack.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/6.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Stack {
    
    // 3.1 数组平均切分成三个栈
    
    let stackSize:Int = 10

    var buffer:[Int?] = [Int?].init(repeating: nil, count: 30)
    var stackPointer:[Int] = [-1, -1, -1]
    
    func push(stackNum:Int,value:Int) {
        
        if stackNum < 0 || stackNum >= stackPointer.count  {
            return
        }
        
        if stackPointer[stackNum] + 1 >= stackSize {
            return
        }
        
        stackPointer[stackNum] += 1
        buffer[absTopOfStack(stackNum: stackNum)] = value
    }
    
    func pop(stackNum:Int) -> Int? {
        if stackNum < 0 || stackNum >= stackPointer.count  {
            return nil
        }
        
        if stackPointer[stackNum] == -1 {
            return nil
        }
        
        let index:Int = absTopOfStack(stackNum: stackNum)
        
        let value:Int? = buffer[index]
        buffer[index] = nil
        stackPointer[stackNum] -= 1
        
        return value
    }
    
    
    func absTopOfStack(stackNum:Int) -> Int {
        return stackNum * stackSize + stackPointer[stackNum]
    }
    
}
