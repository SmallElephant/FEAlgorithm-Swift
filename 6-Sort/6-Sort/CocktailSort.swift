//
//  CocktailSort.swift
//  6-Sort
//
//  Created by FlyElephant on 17/1/23.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class CocktailSort {
 
    func sort(arr:inout [Int]) {
        if arr.count == 0 {
            return
        }
        
        var left:Int = 0
        var right:Int = arr.count - 1
        var index:Int = 0
        
        while left < right {
            for  i in left..<right {
                if arr[i] > arr[i + 1] {
                    swap(&arr[i], &arr[i + 1])
                    index = i
                }
            }
            
            right = index
            let temp:Int = left + 1
            if temp < right {
                for i in (temp...right).reversed() {
                    if arr[i] < arr[i-1] {
                        swap(&arr[i], &arr[i-1])
                        index = i
                    }
                }
                left = index
            }
        }
    }
    
    
}
