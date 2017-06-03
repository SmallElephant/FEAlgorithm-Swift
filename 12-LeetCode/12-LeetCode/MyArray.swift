//
//  MyArray.swift
//  12-LeetCode
//
//  Created by keso on 2017/5/29.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class MyArray {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var index:Int = 1
        
        for i in 1..<nums.count {
            if nums[i] != nums[i - 1] {
                nums[index] = nums[i]
                index += 1
            }
        }
        
        return index
    }
}
