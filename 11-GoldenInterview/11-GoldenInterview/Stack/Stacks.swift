//
//  Stacks.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/6.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Stacks {
    
    let maxSize:Int = 5
    
    var bufferData:[[Int]] = []
    
    func push(num:Int) {
        
        if bufferData.count == 0 {
            var data:[Int] = []
            data.append(num)
            bufferData.append(data)
        } else {
            var data:[Int]? = bufferData.last
            if (data?.count)! < maxSize {
                data?.append(num)
                bufferData[bufferData.count - 1] = data!
            } else {
                var stack:[Int] = []
                stack.append(num)
                bufferData.append(stack)
            }
            
        }
        
    }
    
    func pop() -> Int? {
        
        if bufferData.count == 0 {
            return nil
        }
        
        var data:[Int] = bufferData.last!
        var lastIndex:Int = bufferData.count - 1
        if data.count == 0 {
            if bufferData.count == 1 {
                return nil
            } else {
                bufferData.removeLast()
                lastIndex -= 1
                data = bufferData[lastIndex]
            }
        }
        
        let value:Int = data.last!
        
        data.removeLast()
        
        bufferData[lastIndex] = data

        return value
    }
    
}
