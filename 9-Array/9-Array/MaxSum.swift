//
//  MinSum.swift
//  9-Array
//
//  Created by FlyElephant on 16/12/23.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation


class MaxSum {
//    连续子数组的最大和
//    题目:输入一个整型数组，数组里有正数也有负数。数组中一个或连续的多个整数组成一个子数组。求所有子数组的和的最大值。要求时间复杂度为O(n)。例如输入的数组为{1,-2,3,10,-4,7,2,-5}，和最大的子数组为{3,10,-4,7,2}，因此输出为该子数组的和18。
    
    func findGreatestSumOfSubArray(arr:[Int]) -> Int {
        var maxSum:Int = 0
        var currentSum:Int = 0
        
        for i in 0..<arr.count {
            currentSum += arr[i]
            
            if currentSum > maxSum {
                maxSum = currentSum
            }
            
            if currentSum < 0 { //如果相加为负数,将CurSum置空
                currentSum = 0
            }
        }
        
        return maxSum
    }
}
