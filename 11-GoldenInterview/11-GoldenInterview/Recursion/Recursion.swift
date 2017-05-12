//
//  Recursion.swift
//  11-GoldenInterview
//
//  Created by FlyElephant on 2017/5/12.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Recursion {
    
    // 共有n级台阶，每次可以迈1，2或3级台阶，共有多少种上台阶的方式？
    func countStepWays(n:Int) -> Int {
        
        if n < 0 {
            return 0
        } else if n == 0 {
            return 1
        } else {
            return countStepWays(n:n - 1) + countStepWays(n: n - 2) + countStepWays(n: n - 3)
        }
    }
    
    func countStepWays2(n:Int,map:inout [Int]) -> Int {
        
        if n < 0 {
            return 0
        } else if n == 0 {
            return 1
        } else if map[n] > -1 {
            return map[n]
        } else {
            map[n] = countStepWays2(n: n - 1, map: &map) + countStepWays2(n: n - 2, map: &map) + countStepWays2(n: n - 3, map: &map)
            return map[n]
        }
    }
    
}
