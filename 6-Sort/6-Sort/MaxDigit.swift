//
//  MaxDigit.swift
//  6-Sort
//
//  Created by keso on 2016/12/6.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class MaxDigit {
    // 普通进位
    func normalPrintMaxDigits(digitCount:Int) {
        if digitCount <= 0 {
            return
        }
        var number:[String] = [String].init(repeating: "0", count: digitCount)
        while !self.incrementNumber(number: &number) {
            let result = self.removePreZeroString(data: number.joined())
            print("FlyElephant---\(result)")
        }
    }
    
    // 如果最高为加1之后，会溢出，普通位直接+1输出，如果是大于10，设置carry为1，继续输出
    func incrementNumber(number:inout [String]) -> Bool {
        
        var isOverflow:Bool = false
        var carry:Int = 0
        var sum:Int = 1
        for i in (0..<number.count).reversed() {
            sum = Int(number[i])! + carry
            if i == number.count-1 {
                sum += 1
            }
            if sum >= 10 {
                if i==0 {
                    isOverflow = true
                } else {
                    sum -= 10
                    carry = 1
                    number[i] = String(sum)
                }
            } else {
                number[i] = String(sum)
                break
            }
        }
        return isOverflow
    }
    
    func  removePreZeroString(data:String) -> String {
        var stop:String.Index = data.index(data.startIndex, offsetBy: 0)
        let result:String = data
        for i in 0..<data.characters.count {
            let index:String.Index = data.index(data.startIndex, offsetBy: i)
            let currentChar: Character = data[index]
            if i == data.characters.count-1 && currentChar == "0" {
                stop = index
                break
            }
            if  currentChar != "0"{
                stop = index
                break
            }
        }
        return result.substring(from: stop)
    }
    
    // 递归解法
    func printMaxDigits(digitCount:Int) {
        if digitCount <= 0 {
            return
        }
        var number:[String] = [String].init(repeating: "0", count: digitCount)
        for i in 0..<10 {
            number[0] = String(i)
            self.printMaxDigitsRecursively(number: &number, length: digitCount, index: 0)
        }
    }
    
    
    func printMaxDigitsRecursively(number:inout [String],length:Int,index:Int) -> Void {
        if index == length-1 {
            let result:String = number.joined(separator: "")
            let str:String = self.removePreZeroString(data: result)
            if str != "0" {
                print("FlyElephant--\(str)")
            }
            return
        }
        
        for i in 0..<10 {
            number[index+1] = String(i)
            self.printMaxDigitsRecursively(number: &number, length: length, index: index+1)
        }
    }
    


}
