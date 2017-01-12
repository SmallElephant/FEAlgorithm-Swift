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
//        for i in 0..<len {
//            let result:Double = Double(arr[i]) / total
//            print("\(i+diceCount)---出现的概率----\(result)")
//        }
        
        print("arr的结果---\(arr)")
        for i in diceCount...maxValue {
            let result:Double = Double(arr[i - diceCount]) / total
            print("\(i)---出现的概率----\(result)")
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
                baseProbilityNumber(diceCount: diceCount, remainderDice: diceCount - 1, sum: sum + i, arr: &arr)
            }
        }
    }
    
}
