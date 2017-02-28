//
//  Factorial.swift
//  10-Number
//
//  Created by FlyElephant on 17/2/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Factorial {
    
    //题目1：给定一个整数N，那么N的阶乘N！末尾有多少个0呢？
    func compute1(num:Int) -> Int {
        
        var count:Int = 0
        for i in 1...num {
            var j:Int = i
            
            while j % 5 == 0 {
                count += 1
                j /= 5
            }
        }
        
        return count
    }
    
    
    func compute2(num:Int) -> Int {
        
        var count:Int = 0
        var temp:Int = num
        
        while temp > 0 {
            count += temp / 5
            temp /= 5
        }
        return count
    }
    
   // 求N！的二进制表示中最低位为1的位置。
    func lowestOne(num:Int)->Int {
        var count:Int = 0
        var temp:Int = num
        while temp > 0 {
            temp >>= 1
            count += temp
        }
        return count
    }
    
    func lowestOne1(num:Int) -> Int {
        
        var count:Int = 0
        for i in 1...num {
            var j:Int = i
            
            while j % 2 == 0 {
                j /= 2
                count += 1
            }
        }
        
        return count
    }
    
    // 2的整数次幂
    func isPowerOfBinary(num:Int) -> Bool {
        return num > 0 && (num & (num - 1)) == 0
    }
    
}
