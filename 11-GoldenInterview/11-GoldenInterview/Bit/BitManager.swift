//
//  BitManager.swift
//  11-GoldenInterview
//
//  Created by FlyElephant on 2017/5/9.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class BitManager {
    
    // 5.5 编写一个函数，确定需要改变几个位，才能将整数A转成整数B
    
    func bitSwapRequired(a:Int,b:Int) -> Int {
        
        var result:Int = a ^ b
        var count:Int = 0
        
        while result != 0 {
            if (result & 1) > 0 { // 判断最低位是否为1
                count += 1
            }
            result = result >> 1
        }
        
        return count
    }
    
    func bitSwapRequired2(a:Int,b:Int) -> Int {
        
        var result:Int = a ^ b
        var count:Int = 0
        
        while result != 0 {
            count += 1
            result = result & (result - 1) // 不断的将低位清零
        }
        
        return count
    }
    
}
