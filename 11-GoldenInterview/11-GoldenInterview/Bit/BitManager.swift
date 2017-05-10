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
    
    // 5.6 给定一个介于0和1之间的实数，类型为double，打印它的二进制表示。如果该数字无法精准地用32位以内的二进制表示，则打印“ERROR”.
    func printBinary(num:Float) -> String {
        if num >= 1 && num <= 0 {
            return "ERROR"
        }
        
        var number:Float = num
        var binaryString:String = "."
        
        while number > 0 {
            
            if binaryString.characters.count >= 32 {
                return "ERROR"
            }
            
            let temp:Float = number * 2
            
            if temp >= 1 {
                binaryString.append("1")
                number = temp - 1
            } else {
                binaryString.append("0")
                number = temp
            }
        }
        
        return binaryString
    }
    
    func printBinary2(num:Float) -> String {
        
        if num >= 1 && num <= 0 {
            return "ERROR"
        }
        
        var number:Float = num
        var binaryString:String = "."
        var factor:Float = 0.5
        
        while number > 0 {
            if binaryString.characters.count >= 32 {
                return "ERROR"
            }
            
            if number >= factor {
                binaryString.append("1")
                number -= factor
            } else {
                binaryString.append("0")
            }
            
            factor /= 2
            
        }
        
        return binaryString
    }
    
}
