//
//  AdjustSort.swift
//  6-Sort
//
//  Created by keso on 2017/2/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class AdjustSort {
    
    //将一个未排序的整形数组进行归置，数组中的负数移动到数组的左边，正数移动到数组的右边。0不动
    
    func adjustSort(arr:inout [Int]) {
        
        var start:Int = 0
        var end:Int = arr.count - 1
        
        while start < end {
            
            while start < end && arr[start] < 0 { // 找到最远的负数
                start += 1
            }
            
            while start < end && arr[end] > 0 {
                end -= 1
            }
            
            if start < end {
                swap(&arr[start], &arr[end])
            }
        }
        
    }
    
}
