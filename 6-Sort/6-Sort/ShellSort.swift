//
//  ShellSort.swift
//  6-Sort
//
//  Created by FlyElephant on 17/1/22.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


class ShellSort {
    
    func sort(arr:inout [Int]) {
        
        let count:Int = arr.count
        var gap:Int = 1
        let base:Int = 3
        while (gap < count / base) {
            gap = base * gap + 1;
        }
        
        while gap > 0 {
            for i in gap..<count {
                for j in (gap...i).reversed()  {
                    if  arr[j] < arr[j-gap]{
                        swap(&arr[j], &arr[j-gap])
                    }

                }
            }
            gap = gap / base
        }
    }
    
}
