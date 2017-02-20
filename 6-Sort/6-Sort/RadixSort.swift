//
//  RadixSort.swift
//  6-Sort
//
//  Created by FlyElephant on 17/1/22.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class RadixSort {
    
    func sort(arr:inout [Int]) {
        if arr.count == 0 {
            return
        }
        
        var list:[[Int]] = []
        for _ in 0..<10 {
            let temp:[Int] = []
            list.append(temp)
        }
        
        let maxDigit:Int = maxlength(arr: arr)
        var tempArr:[Int] = arr
        for i in 0..<maxDigit {
            for j in 0..<arr.count {
                let index:Int = highDigit(num: tempArr[j], index: i)
                list[index].append(tempArr[j])
            }
            saveBucketData(bucketlist: &list, arr: &tempArr)
        }
        arr = tempArr
    }
    
    // 桶的数据插入数组
    private func saveBucketData(bucketlist:inout [[Int]],arr:inout [Int]) {
        var index:Int = 0
        for i in 0..<bucketlist.count {
            var bucket:[Int] = bucketlist[i]
            if bucket.count > 0 {
                for j in 0..<bucket.count {
                    arr[index] = bucket[j]
                    index += 1
                }
            }
            bucketlist[i].removeAll() // 注意清空桶数据
        }
    }
    
    private func highDigit(num:Int,index:Int)->Int {
        let base:Double = pow(10, Double(index))
        let high:Int = (num / Int(base)) % 10
        return high
    }
    
    // 最大数字的位数
    private func maxlength(arr:[Int])->Int {
        var max:Int = 0
        for i in 0..<arr.count {
            let count:Int = positionOfNum(number: arr[i])
            if count > max {
                max = count
            }
        }
        return max
    }
    
    // 统计数字的位数
    private func positionOfNum(number:Int)->Int {
        var count:Int = 0
        var num:Int = number
        while num%10 > 0  {
            count += 1
            num = num / 10
        }
        return count
    }
}
