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
        
        for i in 1..<count { //注意起始位置
            for j in (1...i).reversed() {
                if arr[j] < arr[j-1] {
                    swap(&arr[j], &arr[j-1])
                }
            }
        }
    }
    
}
