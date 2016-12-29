//
//  ReversePairs.swift
//  9-Array
//
//  Created by FlyElephant on 16/12/29.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class ReversePairs {
    // 数组中的逆序对
//    题目：在数组中的两个数字如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。例如，有一个数组为Array[0..n] 其中有元素a[i]，a[j].如果 当i<j时，a[i]>a[j],那么我们就称（a[i],a[j]）为一个逆序对。在数组{7,5,6,4}中一共存在5对逆序对，分别是(7,6),(7,5),(7,4),(6,4),(5,4)。
    func reversPairs(arr:inout [Int],low:Int,high:Int) -> Int {
        if low >= high {
            return 0
        }
        let mid:Int = (low+high)/2
        
        let leftCount:Int = reversPairs(arr: &arr, low: low, high: mid)
        let rightCount:Int = reversPairs(arr: &arr, low: mid+1, high: high)
        return leftCount + rightCount + merge(arr: &arr, low: low, mid: mid, high: high)
    }
    
    func merge(arr:inout [Int],low:Int,mid:Int,high:Int) -> Int {
        let count:Int = high - low + 1
        var tempArr:[Int] = [Int].init(repeating: 0, count: count)
        
        var left:Int = low //左指针
        var right:Int = mid + 1 //右指针
        var index:Int = 0
        var reverseCount:Int = 0
        
        while left <= mid && right <= high {
            if arr[left] < arr[right] {
                tempArr[index] = arr[left]
                left += 1
            } else {
                reverseCount += mid-left+1 // 统计逆序对
                tempArr[index] = arr[right]
                right += 1
            }
            index += 1
        }
        
        while left <= mid {
            tempArr[index] = arr[left]
            left += 1
            index += 1
        }
        
        while right <= high {
            tempArr[index] = arr[right]
            right += 1
            index += 1
        }
        
        for m in 0..<tempArr.count {
            arr[low+m] = tempArr[m]
        }
        
        return reverseCount
    }
    
}
