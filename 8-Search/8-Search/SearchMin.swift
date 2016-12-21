//
//  SearchMin.swift
//  8-Search
//
//  Created by FlyElephant on 16/12/21.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class SearchMin {
    //最小的K个数
    //题目:输入n个整数，找出其中最小的K个数。例如输入4,5,1,6,2,7,3,8这8个数字，则最小的4个数字是1,2,3,4.
    
    func leastMinNumbers(arr:[Int],k:Int) -> [Int] {
        var data:[Int] = arr
        var result:[Int] = []
        
        quickSort(arr: &data, low: 0, high: data.count-1)
        
        for i in 0..<k {
            result.append(data[i])
        }
        
        return result
    }
    
    func quickSort(arr:inout [Int],low:Int,high:Int) {
        if low > high {
            return
        }
        let middle = partition(arr: &arr, low: low, high: high)
        quickSort(arr: &arr, low: low, high: middle-1)
        quickSort(arr: &arr, low: middle+1, high: high)
    }
    
    
    func partition(arr:inout [Int],low:Int,high:Int) -> Int {
        let root:Int = arr[high]
        var index:Int = low
        
        for i in low..<high {
            if arr[i] < root {
                if i != index {
                    swap(&arr[i], &arr[index])
                }
                
                index += 1
            }
        }
        
        if index != high {
            swap(&arr[index], &arr[high])
        }
        return index
    }
}
