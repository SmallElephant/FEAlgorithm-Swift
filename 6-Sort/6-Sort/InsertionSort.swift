//
//  InsertionSort.swift
//  6-Sort
//
//  Created by FlyElephant on 17/1/21.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class InsertionSort {
    
    func sort(arr:inout [Int]) {
        let count:Int = arr.count
        
        for i in 0..<count {
            for j in 0..<i {
                if arr[j] > arr[j+1] {
                    swap(&arr[j], &arr[j+1])
                }
            }
        }
        
    }
    
}
