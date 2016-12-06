//
//  Power.swift
//  6-Sort
//
//  Created by FlyElephant on 16/12/1.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class Power {
    //实现函数double Power(double base, int exponent)，求base的exponent次幂。不得使用库函数，同时不需要考虑大数问题
    
    func power(base:Double,exponent:Int) -> Double {
        if base == 0 {
            return 0
        }
        
        if exponent == 0 {
            return 1
        }
        
        let num:Int = exponent > 0 ? exponent :abs(exponent)
        let result:Double = self.multiWithExponent(base: base, exponet: num)
        //let result:Double = self.multiWithExponentRecursion(base: base, exponet: num)
        //let result:Double = self.multiWithExponentNormal(base: base, exponet: num)
        if exponent < 0 {
            return 1.0/result
        }
        return result
    }
    
    func multiWithExponent(base:Double,exponet:Int) -> Double {
        var result:Double = 1
        for _ in 0..<exponet {
            result *= base
        }
        return result
    }
    
    // 递归
    func multiWithExponentRecursion(base:Double,exponet:Int) -> Double {
        if exponet == 0 {
            return 1
        }
        
        if exponet == 1 {
            return base
        }
        
        var result:Double = self.multiWithExponent(base: base, exponet: exponet>>1)
        result *= result
        if  (exponet & 1) == 1 {
            result *= base
        }
        return result
    }
    
    // 非递归
    func multiWithExponentNormal(base:Double,exponet:Int) -> Double {
        var result:Double = 1.0
        var tempBase:Double = base
        var tempExponet:Int = exponet
        
        while tempExponet > 0 {
            if (tempExponet & 1) == 1{
                result *= tempBase
            }
            tempBase *= tempBase
            tempExponet = tempExponet>>1
        }
        return result
    }
}
