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
    
    // 5.2 给定一个介于0和1之间的实数，类型为double，打印它的二进制表示。如果该数字无法精准地用32位以内的二进制表示，则打印“ERROR”.
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
    

    // 5.1给定两个32位的整数N与M，以及表示比特位置的i与j。编写一个方法，将M插入N，使得M从N的第 j 位开始，到第 i 位结束。
    
   // 假定从 j 到 i 位足以容纳M，也即若M = 10011， 那么 j 和 i 之间至少可容纳5个位。 例如， 不可能出现 j = 3 和 i = 2的情况，因为第3位和第2位之间放不下M。
    func updateBits(n:Int,m:Int,i:Int,j:Int) -> Int {
        
        // 设置掩码为 11100011
        let allOnes:Int = ~0
        
        let left = allOnes << (j + 1)
        
        let right = ((1 << i) - 1)
        
        let mask = left | right
        
        let n_clear = n & mask
        let m_shifted = m << i
        
        return n_clear | m_shifted
        
    }
    
    // 5.6 编写程序交换某个整数的奇数位和偶数位，使用指令越少越好（即位0与位1交换，位2与位3交换）。看过题目解析之后才发觉，这题要交换的是整数二进制的奇数和偶数位。
    
    func swapOddEvenBits(num:Int) -> Int {
        return (((num & 0xaaaaaaaa) >> 1 ) | ( ( num & 0x55555555 ) << 1))
    }
    
    
    func checkDuplicates(arr:[Int]) {
        
        let bitSet:BitSet = BitSet(size: 32000)
        
        for i in 0..<arr.count {
            
            let num = arr[i]
            let num0 = num - 1
            
            if bitSet.get(pos: num0) {
                print("FlyElephant---重复数据:\(num)")
            } else {
                bitSet.set(pos: num0)
            }
        }
    }
    
}
