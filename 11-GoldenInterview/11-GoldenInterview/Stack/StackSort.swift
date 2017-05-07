//
//  StackSort.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/7.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class StackSort {
    
    
    func sort(data:[Int])->[Int] {
        
        var stack:[Int] = data
        var nextStack:[Int] = []
        
        while stack.count > 0 {
            
            let top:Int = stack.last!
            stack.removeLast() // 移除
            
            while nextStack.count > 0 &&  nextStack.last! > top {
                stack.append(nextStack.last!)
                nextStack.removeLast()
            }
            
            nextStack.append(top)
        }
        
        return nextStack
        
    }
    
}
