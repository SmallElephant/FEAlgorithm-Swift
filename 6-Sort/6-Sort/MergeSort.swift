//
//  MergeSort.swift
//  6-Sort
//
//  Created by FlyElephant on 16/12/29.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class MergeSort {
    
    func mergeSort(arr:inout [Int],low:Int,high:Int)  {
        if low >= high {
            return
        }
        let mid:Int = (low + high)/2
        mergeSort(arr: &arr, low: low, high: mid)
        mergeSort(arr: &arr, low: mid + 1, high: high)
        merge(arr: &arr, low: low, mid: mid, high: high)
    }
    
    func merge(arr:inout [Int],low:Int,mid:Int,high:Int)  {
        let count:Int = high - low + 1
        var tempArr:[Int] = [Int].init(repeating: 0, count:count)
        var i:Int = low //左数组的指针
        var j:Int = mid + 1 //右数组的指针
        var index:Int = 0
        
        while i <= mid && j <= high {
            if arr[i] < arr[j] {
                tempArr[index] = arr[i]
                i += 1
            } else {
                tempArr[index] = arr[j]
                j += 1
            }
            index += 1
        }
        
        while i <= mid {
            tempArr[index] = arr[i]
            i += 1
            index += 1
        }
        
        while j <= high {
            tempArr[index] = arr[j]
            j += 1
            index += 1
        }
        
        for m in 0..<tempArr.count {
            arr[low+m] = tempArr[m]
        }
        
    }
    
}

