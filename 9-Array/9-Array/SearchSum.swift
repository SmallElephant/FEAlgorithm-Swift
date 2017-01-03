//
//  SearchSum.swift
//  9-Array
//
//  Created by FlyElephant on 17/1/3.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class SearchSum {
    
    func findNumber(arr:[Int],sum:Int) -> (Int,Int)? {
        if arr.count == 0 {
            return nil
        }
        
        for i in 0..<arr.count {
            let num:Int = arr[i]
            for j in i..<arr.count {
                if arr[j] == (sum - num) {
                    return (num,arr[j])
                }
            }
        }
        return nil
    }
    
}
