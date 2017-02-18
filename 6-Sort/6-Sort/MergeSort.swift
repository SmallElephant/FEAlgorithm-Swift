//
//  MergeSort.swift
//  6-Sort
//
//  Created by FlyElephant on 16/12/29.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class MergeSort {
    
    func mergeSort(arr:inout [Int],low:Int,high:Int) {
        if low >= high {
            return
        }
        let mid = (low + high) / 2
        
        mergeSort(arr: &arr, low: low, high: mid)
        mergeSort(arr: &arr, low: mid + 1, high: high)
        merge(arr: &arr, low: low, mid: mid, high: high)
    }
    
    func merge(arr:inout [Int],low:Int,mid:Int,high:Int) {
        let count:Int = high - low + 1
        var temp:[Int] = [Int].init(repeating: 0, count: count)
        var i:Int = low // 左指针
        var j:Int = mid + 1 // 右指针
        var index:Int = 0
        
        while i <= mid && j <= high {
            if arr[i] < arr[j] {
                temp[index] = arr[i]
                i += 1
            } else {
                temp[index] = arr[j]
                j += 1
            }
            index += 1
        }
        
        while i <= mid { // 左边数组还有未比较的数字
            temp[index] = arr[i]
            i += 1
            index += 1
        }
        
        while j <= high {
            temp[index] = arr[j]
            j += 1
            index += 1
        }
        
        for m in 0..<count {
            arr[low+m] = temp[m]
        }
        
    }
    
}

