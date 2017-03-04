//
//  FEArray.swift
//  10-Number
//
//  Created by FlyElephant on 17/2/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class FEArray {
    
    func moreThanHalfNumber(arr:[Int]) -> Int? {
        if arr.count == 0 {
            return nil
        }
        
        var target:Int = arr[0]
        var count:Int = 1
        
        for i in 1..<arr.count {
            if count == 0 {
                target = arr[i]
                count = 1
            } else if target == arr[i] {
                count += 1
            } else {
                count -= 1
            }
        }
        return target
    }
}
