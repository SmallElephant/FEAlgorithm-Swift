//
//  Fibonacci.swift
//  10-Number
//
//  Created by keso on 2017/3/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Fibonacci {
    
    func fibonaccciCount(n:Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        } else {
            return fibonaccciCount(n: n - 2) + fibonaccciCount(n: n - 1)
        }
    }
    
    func fibonaccciCount1(n:Int) -> Int {
        if n == 0 {
            return 0
        }
        
        if n == 1 {
            return 1
        }
        
        var first:Int = 0
        var second:Int = 1
        var result:Int = 0
        
        for _ in 2...n {
            result = first + second
            first = second
            second = result
        }
        
        return result
    }

    
    
    
}
