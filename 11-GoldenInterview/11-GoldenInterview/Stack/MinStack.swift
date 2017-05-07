//
//  MinStack.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/6.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class MinStack {
    
    var stack:[Int] = []
    var minStack:[Int] = []
    
    func push(value:Int) {
        stack.append(value)
        
        let minValue:Int? = min()
        if minValue == nil  || value <= minValue! { // 与最小值相等的时候说明有重复数据
            minStack.append(value)
        }
    }
    
    func pop() {
        
        if stack.count == 0 {
            return
        }
        
        let value:Int = stack.last!
        stack.removeLast()
        
        if value == min() {
            minStack.removeLast()
        }
        
    }
    
    func min() -> Int? {
        if minStack.count == 0 {
            return nil
        }
        return minStack.last!
    }
}
