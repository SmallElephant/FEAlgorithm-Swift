//
//  Calculator.swift
//  10-Number
//
//  Created by keso on 2017/3/11.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Calculator {
    
    func multiMaxValue(arr:[Int]) -> Int {
        
        let count:Int = arr.count
        var left:[Int] = [Int].init(repeating: 1, count: count)
        var right:[Int] = [Int].init(repeating: 1, count: count + 1)
        
        for i in 1..<count { // 左边数据叠乘
            left[i] = arr[i - 1] * left[i - 1]
        }
        
        for j in stride(from: count - 1, to: 0, by: -1) { // 右边数据叠乘
            right[j] = arr[j] * right[j + 1]
        }
        
        var maxValue:Int = 1
        for i in 0..<count { // 计算最大值-FlyElephant
            let value = left[i] * right[i + 1]
            if value > maxValue {
                maxValue = value
            }
        }
        return maxValue
    }
   // 写一个时间复杂度尽可能低的程序，求一个一维数组（N个元素）中最长递增子序列的长度。

    func maxSubsequence(arr:[Int])->Int {
        var list:[Int] = [Int].init(repeating: 0, count: arr.count)
        
        for i in 0..<arr.count {
            
            list[i] = 1
            
            for j in 0..<i { // 与当前的数字对比，更新每个位置最大的长度
                
                if arr[i] > arr[j] && list[j] + 1 > list[i] {
                    list[i] = list[j] + 1
                }
            }
        }
        
        return maxArray(arr: list)
    }
    
    func maxArray(arr:[Int]) -> Int {
        var max:Int = arr[0]
        
        for i in 0..<arr.count {
            if arr[i] > max {
                max = arr[i]
            }
        }
        
        return max
    }
    
    func reverseArr(arr:inout [String],k:Int) {
        if arr.count == 0 {
            return
        }
        let count:Int = arr.count
        let k:Int = k % count
        reverse(arr: &arr, begin: 0, end: count - k - 1)
        reverse(arr: &arr, begin: k, end: count - 1)
        reverse(arr: &arr, begin: 0, end: count - 1)
    }
    
    private func reverse(arr:inout [String],begin:Int,end:Int) {
        
        var low:Int = begin
        var high:Int = end
        
        while low < high {
            swap(&arr[low], &arr[high])
            low += 1
            high -= 1
        }
    }
    
    
}
