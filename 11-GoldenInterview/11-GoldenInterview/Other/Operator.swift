//
//  Operator.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


class Operator {
    
    func negate(a:Int) -> Int {
        
        var num:Int = a
        var result:Int = 0
        
        let base:Int = num < 0 ? 1 : -1
        
        while num != 0 {
            result += base
            num += base
        }
        
        return result
    }
    
    func minus(a:Int,b:Int) -> Int {
        return a + negate(a: b)
    }
    
    func multiply(a:Int,b:Int) -> Int {
        
        if a < b {
            return multiply(a:b,b:a)
        }
        
        var sum:Int = 0
        
        for _ in  0..<abs(a: b) {
            sum += a
        }
        
        if b < 0 {
            sum = negate(a: sum)
        }
        
        return sum
    }
    
    func abs(a:Int) -> Int {
        if a < 0 {
            return negate(a:a)
        } else {
            return a
        }
    }
    
    func divide(a:Int,b:Int) -> Int? {
        
        if b == 0 {
            return nil
        }
        
        let numA:Int = abs(a: a)
        let numB:Int = abs(a: b)
        
        var result:Int = 0
        var num:Int = 0
        
        while (numB + num) < numA {
            num += numB
            result += 1
        }
        
        if (a > 0 && b > 0) || (a < 0 && b < 0) {
            return result
        } else {
            return negate(a: result)
        }
        
    }
    
}
