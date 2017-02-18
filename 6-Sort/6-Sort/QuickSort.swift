//
//  QuickSort.swift
//  6-Sort
//
//  Created by FlyElephant on 17/1/22.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


class QuickSort {
    
    
    func quickSort(arr:inout [Int],low:Int,high:Int) {
        if low >= high {
            return
        }
        
        let position:Int = partition(arr: &arr, low: low, high: high)
        quickSort(arr: &arr, low:low, high: position - 1)
        quickSort(arr: &arr, low:position + 1, high: high)
    }
    
    func partition(arr:inout [Int],low:Int,high:Int)->Int {
        let root:Int = arr[high]
        var index:Int = low
        
        for i in low...high {
            if arr[i] < root {
                if index != i {
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
