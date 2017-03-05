//
//  CommonNumber.swift
//  10-Number
//
//  Created by keso on 2017/3/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class CommonNumber {
    
    func gcd(a:Int,b:Int)->Int {
        if b == 0 {
            return a
        } else {
            return gcd(a: b, b: a % b)
        }
    }
    
    func gcd1(a:Int,b:Int) -> Int {
        if a < b {
            return gcd1(a: b, b: a)
        }
        
        if b == 0 {
            return a
        } else {
            return gcd1(a: a - b, b: b)
        }
    }
    
    
    func gcd2(a:Int,b:Int) -> Int {
        if  a < b {
            return gcd2(a: b, b: a)
        }
        
        if b == 0 {
            return a
        } else {
            if isEven(num: a) { // 偶数
                if isEven(num: b) {
                    return gcd2(a: a >> 1, b: b >> 1) << 1
                } else {
                    return gcd2(a: a >> 1, b: b)
                }
                
            } else {
                if isEven(num: b) {
                    return gcd2(a: a, b: b >> 1)
                } else {
                    return gcd2(a: b, b: a - b)
                }
            }
        }
    }
    
    func isEven(num:Int)->Bool {
        return num % 2 == 0 ? true : false
    }
    
    
}
