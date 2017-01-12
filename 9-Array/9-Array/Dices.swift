//
//  Dices.swift
//  9-Array
//
//  Created by FlyElephant on 17/1/11.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Dices {
    //43.n个骰子的点数
    //题目：把n个骰子扔在地上，所有骰子朝上一面的点数之和为S。输入n，打印出S的所有可能的值出现的概率。
    
    func probility(diceCount:Int)  {
        
        let total:Double = pow(6.0, Double(diceCount))
        let maxValue:Int = 6 * diceCount
        let len:Int = maxValue - diceCount + 1
        var arr:[Int] = [Int].init(repeating: 0, count: len)
        probilityNumber(diceCount: diceCount, arr: &arr)
        for i in 0..<len {
            let result:Double = Double(arr[i]) / total
            print("FlyElephant--\(i+diceCount)---出现的概率----\(result)")
        }
    }
    
    
    func probilityNumber(diceCount:Int,arr:inout [Int]) {
        for i in 1...6 {
            baseProbilityNumber(diceCount: diceCount, remainderDice: diceCount, sum: i, arr: &arr)
        }
    }
    
    // diceCount 🎲总数 remainderDice 剩余的🎲
    func baseProbilityNumber(diceCount:Int,remainderDice:Int,sum:Int,arr:inout [Int])  {
        if remainderDice == 1 {
            arr[sum - diceCount] = arr[sum - diceCount] + 1
        } else {
            for i in 1...6 {
                baseProbilityNumber(diceCount: diceCount, remainderDice: remainderDice - 1, sum: sum + i, arr: &arr)
            }
        }
    }
    
    
    func diceProbility(diceCount:Int) {
        var arr:[[Int]] = []
        let maxLen:Int = 6 * diceCount + 1
        let first:[Int] = [Int].init(repeating: 0, count: maxLen)
        let next:[Int] = [Int].init(repeating: 0, count: maxLen)
        arr.append(first)
        arr.append(next)
        
        var flag:Int = 0
        for i in 1...6 {
            arr[flag][i] = 1
        }
        
        
        for i in 2...diceCount {
            for j in 0..<i {
                arr[1-flag][j] = 0
            }
            for k in i...6 * i {
                var m:Int = 1
                arr[1-flag][k] = 0
                while m <= k && m <= 6 {
                    arr[1-flag][k] += arr[flag][k-m]
                    m += 1
                }
            }
            flag = 1 - flag
        }
        let total:Double = pow(6.0, Double(diceCount))
        for i in diceCount...6 * diceCount {
            let rate:Double = Double(arr[flag][i])/total
            print("FlyElephant--\(i)出现的概率---\(rate)")
        }
        
    }
    
}
