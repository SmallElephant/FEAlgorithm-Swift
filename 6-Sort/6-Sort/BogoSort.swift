//
//  BogoSort.swift
//  6-Sort
//
//  Created by FlyElephant on 17/1/23.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class BogoSort {
    
    func sort(arr:inout [Int]) {
        if arr.count == 0 {
            return
        }
        
        var sorted:Bool = isSorted(arr: arr)
        while sorted == false {
            shuffle(arr: &arr)
            sorted = isSorted(arr: arr)
        }
    }
    
    private func shuffle(arr:inout [Int]) {
        let count:Int = arr.count
        for i in 0..<count {
            let index:Int = Int(arc4random_uniform(UInt32(arr.count)))
            if i != index {
                swap(&arr[i], &arr[index])
            }
        }
    }
    
    private func isSorted(arr:[Int])->Bool {
        var isSorted:Bool = true
        for i in 0..<arr.count - 1 {
            if arr[i] > arr[i+1] {
                isSorted = false
                break
            }
        }
        return isSorted
    }
    
}
