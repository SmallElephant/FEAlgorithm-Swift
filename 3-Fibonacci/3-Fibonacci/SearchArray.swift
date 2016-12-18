//
//  SearchArray.swift
//  3-Array
//
//  Created by keso on 2016/12/18.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class SearchArray {
    //数组中出现次数超过一半的数字
   // 题目：数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。例如输入一个长度为9的数组{1,2,3,2,2,5,4,2}。由于数字2在数组中出现了5词，超过数组长度的一半，因此输出2.
    
    func moreThanHalfNum(arr:[Int]) -> Int? {
        if arr.count == 0 {
            return nil
        }
        var num:Int = arr[0]
        var times:Int = 1
        for i in 1..<arr.count {
            if times == 0 {
                num = arr[i]
                times = 1
            } else {
                if arr[i] == num {
                    times += 1
                } else {
                    times -= 1
                }
            }
        }
        return num
    }
    
}
