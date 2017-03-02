//
//  BigNumber.swift
//  10-Number
//
//  Created by FlyElephant on 17/3/1.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class BigNumber {
    
    func kBigNumber(arr:inout [Int],low:Int,high:Int,k:Int)->Int {
        var result:Int = -1
        if low <= high {
            let index = partition(arr: &arr, low: low, high: high)
            let num:Int = index - low + 1 // index 之前数组暂定为a, index 之后的数组定为b
            
            if num > k { // 如果a的数据大于b的要求，从a 中选择k个数字
                result = kBigNumber(arr: &arr, low: low, high: index - 1, k: k)
            } else if num < k { //如果a的个数不够的话，那么再从b中找K-n个
                result = kBigNumber(arr: &arr, low: index + 1, high: high , k: k - num)
            } else {
                result = index
            }
        }
        return result
    }
    
    func quickSort(arr:inout [Int],low:Int,high:Int)  {
        if low >= high {
            return
        }
        let mid:Int = partition(arr: &arr,low:low,high:high)
        quickSort(arr: &arr, low: low, high: mid - 1)
        quickSort(arr: &arr, low: mid + 1, high: high)
    }
    
    func partition(arr:inout [Int],low:Int,high:Int) -> Int {
        
        let root:Int = arr[high]
        var index:Int = low
        
        for i in low...high {
            if arr[i] > root {
                if i != index {
                    swap(&arr[i], &arr[index])
                }
                index += 1
            }
        }
      
        if index != high {
            swap(&arr[high], &arr[index])
        }
        
        return index
    }
    
    func partition2(arr:inout [Int],low:Int,high:Int) -> Int {
        
        let root:Int = arr[low]
        var index:Int = low
        
        for i in low...high {
            if arr[i] > root {
                if i != index {
                    swap(&arr[i], &arr[index])
                }
                index += 1
            }
        }
        
        if index != low {
            swap(&arr[low], &arr[index])
        }
        
        return index
    }
    
}
