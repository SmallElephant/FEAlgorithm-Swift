//
//  MyQueue.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/7.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class MyQueue {
    
    var stackNew:[Int] = []
    var stackOld:[Int] = []
    
    func push(value:Int) {
        stackNew.append(value)
    }
    
    func peek() -> Int? {
        shiftStacks()
        let value:Int? = stackOld.last
        if value != nil {
            stackOld.removeLast()
        }
        return value
    }
    
    private func shiftStacks() {
        if stackOld.count == 0 {
            while stackNew.count > 0 {
                let value:Int = stackNew.last!
                stackNew.removeLast()
                stackOld.append(value)
            }
        }
    }
}
