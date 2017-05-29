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
    
    func magicFast(arr:inout [Int],start:Int,end:Int) -> Int {
        if arr.count == 0 || start < 0 || end >= arr.count || end < start {
            return -1
        }
        
        let mid:Int = (start + end) / 2
        
        let midValue:Int = arr[mid]
        
        if mid == midValue {
            return mid
        } else if midValue > mid {
            return magicFast(arr: &arr, start: start, end: mid - 1)
        } else {
             return magicFast(arr: &arr, start: mid + 1, end: end)
        }
    }
    
    func magicFast2(arr:inout [Int],start:Int,end:Int) -> Int {
        if arr.count == 0 || start < 0 || end >= arr.count || end < start {
            return -1
        }
        
        let mid:Int = (start + end) / 2
        
        let midValue:Int = arr[mid]
        
        
        if mid == midValue {
            return mid
        }
        
        let leftIndex:Int = min(mid - 1, midValue)
        let left:Int = magicFast2(arr: &arr, start: start, end: leftIndex)
        if left >= 0 {
            return left
        }
        
        let rightIndex:Int = max(mid + 1, midValue)
        let right:Int = magicFast2(arr: &arr, start: rightIndex, end: end)
        return right
    }
    
    
    // 字符串的所有排列组合
    
    func getPerms(str:String) -> [String] {
        
        var permutations:[String] = []
        
        if str.characters.count == 0 {
            permutations.append("")
            return permutations
        }
        
        let first:String = str[0]
        let index = str.index(str.startIndex, offsetBy: 1)
        let remainder:String = str.substring(from: index)
        let words:[String] = getPerms(str: remainder)
        
        for word in words {
            
            for i in 0...word.characters.count {
                let str:String = insertCharAt(word: word, mid: first, i: i)
                permutations.append(str)
            }
        }
        
        return permutations
    }
    
    func insertCharAt(word:String,mid:String,i:Int) -> String {
        let index = word.index(word.startIndex, offsetBy: i)
        let start:String = word.substring(to: index)
        let end:String = word.substring(from: index)
        let result = start + mid + end
        return result
    }
    
    //给定数量不限的硬币，币值为25分，10分，5分和1分，编写代码计算n分有几种表示法
    
    func makeChange(n:Int,denom:Int) -> Int {
        
        var next_denom:Int = 0
        switch denom {
        case 25:
            next_denom = 10
            break
        case 10:
            next_denom = 5
            break
        case 5:
            next_denom = 1
            break
        case 1:
            return 1
        default:
            break
        }
        
        var ways:Int = 0
        
        var i:Int = 0
        
        while i * denom <= n {
            ways += makeChange(n: n - i * denom, denom: next_denom)
            i += 1
        }
        return ways
    }
    
    
    
    
}
