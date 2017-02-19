//
//  BubbleSort.swift
//  6-Sort
//
//  Created by FlyElephant on 17/1/21.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class BubbleSort {
    
    
    func bubbleSort(arr:inout [Int]) {
        let count:Int = arr.count
        for i in 0..<count {
            for j in i..<count {
                if arr[i] > arr[j] {
                    swap(&arr[i], &arr[j])
                }
            }
        }
    }
    
    func bubbleSort1(arr:inout [Int]) {
        let count:Int = arr.count
        for i in 0..<count {
            let max:Int = count - i - 1
            for j in 0..<max {
                if arr[j] > arr[j+1] {
                    swap(&arr[j], &arr[j+1])
                }
            }
        }
    }
    
    func bubbleSort2(arr:inout [Int]) {
        let count:Int = arr.count
        for i in (0..<count).reversed() {
            for j in 0..<i {
                if arr[j] > arr[j+1] {
                    swap(&arr[j], &arr[j+1])
                }
            }
        }
    }
    
    func bubbleSortString(arr:inout [String]) {
        let count:Int = arr.count
        for i in 0..<count {
            let max:Int = count - i - 1
            for j in 0..<max {
                if arr[j] > arr[j+1] {
                    swap(&arr[j], &arr[j+1])
                }
            }
        }
    }
    
}
