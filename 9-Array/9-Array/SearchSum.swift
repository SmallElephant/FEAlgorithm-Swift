//
//  SearchSum.swift
//  9-Array
//
//  Created by FlyElephant on 17/1/3.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class SearchSum {
    //和为S的两个数字
//    题目：输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，输出任意一对即可.
    func findNumber(arr:[Int],sum:Int) -> (Int,Int)? {
        if arr.count == 0 {
            return nil
        }
        
        for i in 0..<arr.count {
            let num:Int = arr[i]
            for j in i..<arr.count {
                if arr[j] == (sum - num) {
                    return (num,arr[j])
                }
            }
        }
        return nil
    }
    
    func findNumberWithSum(arr:[Int],sum:Int) -> (Int,Int)? {
        if arr.count == 0 {
            return nil
        }
        var low:Int = 0
        var high:Int = arr.count - 1
        
        while low < high {
            let tempSum:Int = arr[low] + arr[high]
            if  tempSum > sum {
                high = high - 1
            } else if tempSum < sum {
                low = low + 1
            } else {
                return (arr[low],arr[high])
            }
        }
        return nil
    }
//    和为S的连续正数序列
//    题目：输入一个正数S，打印出所有和为S的连续正数序列（至少有两个数）。例如输入15，由于1+2+3+4+5=4+5+6=7+8=15，所以结果打印出3个连续序列1~5，4~6和7~8.
    func findContinuousSequence(sum:Int) -> [[Int]]? {
        if sum <= 0 {
            return nil
        }
        
        var small:Int = 1
        var big:Int = 2
        let mid:Int = (1 + sum)/2
        var allSequence:[[Int]] = []
        var currentSum:Int = small + big // 至少两个数字，small最多到一半位置
        while small < mid {
            if currentSum == sum {// 相等保存
                continuousSequence(small: small, big: big, data: &allSequence)
            }
            
            while currentSum > sum && small < mid { // 大于sum，增加small，先减后加
                currentSum -= small
                small += 1
                if currentSum == sum {
                    continuousSequence(small: small, big: big, data: &allSequence)
                }
            }
            
            big += 1// 小于sum，增加big
            currentSum += big
        }
        return allSequence
    }
    
    func continuousSequence(small:Int,big:Int,data:inout [[Int]])  {
        var temp:[Int] = []
        for  i in small...big {
            temp.append(i)
        }
        data.append(temp)
    }
    
}
