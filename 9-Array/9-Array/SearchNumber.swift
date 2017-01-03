//
//  SearchNumber.swift
//  9-Array
//
//  Created by FlyElephant on 17/1/3.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class SearchNumber {
    //数组中只出现一次的数字
    //题目:一个整型数组里除了两个数字之外，其他的数字都出现了两次。请找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1).

    // 1首次出现的位置
    func indexOfOne(num:Int) -> Int {
        var number:Int = num
        var pos:Int = 1
        
        while (number & 1) == 0 {
            number = number >> 1
            pos += 1
        }
        
        return pos
    }
    
    func isNumberOfPos(num:Int,pos:Int) -> Bool {
//        let temp:Int = 1 << (pos - 1)
//        return (num & temp) == 0 ? false : true
        
        let number:Int = num >> (pos - 1)
        return (number & 1) == 1 ? true : false
    }
    
    func findNumberAppearOnce(arr:[Int]) -> (Int,Int) {
        
        var ORNum:Int = 0
        
        for i in 0..<arr.count {
            ORNum = ORNum ^ arr[i]
        }
        
        let position:Int = indexOfOne(num: ORNum)
        var first:Int = 0
        var second:Int = 0
        for i in 0..<arr.count {
            if  isNumberOfPos(num: arr[i], pos: position) {
                first = first ^ arr[i]
            } else {
                second = second ^ arr[i]
            }
        }
        return (first,second)
    }
}
