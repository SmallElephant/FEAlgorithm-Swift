//
//  SelectSort.swift
//  6-Sort
//
//  Created by FlyElephant on 17/1/21.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class SelectSort {
    
    func sort(arr:inout [Int]) {
        let count:Int = arr.count
        for i in 0..<count {
            var minIndex:Int = i
            for j in i..<count {
                if arr[minIndex] > arr[j] {
                    minIndex = j
                }
            }
            if i != minIndex {
               swap(&arr[i], &arr[minIndex])
            }
        }
    }
    
}
