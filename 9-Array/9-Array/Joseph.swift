//
//  Joseph.swift
//  9-Array
//
//  Created by FlyElephant on 17/1/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Joseph {
    
   // 圆圈中最后剩下的数字
   //题目:n个数字（0,1,…,n-1）形成一个圆圈，从数字0开始，每次从这个圆圈中删除第m个数字（第一个为当前数字本身，第二个为当前数字的下一个数字）。当一个数字删除后，从被删除数字的下一个继续删除第m个数字.求出在这个圆圈中剩下的最后一个数字.
    
    func lastNumber(n:Int,m:Int)->Int {
        
        if n < 1 || m < 1 {
            return -1
        }
        
        var number:Int = 0

        if n >= 2 {
            for i in 2...n {
                number = (number + m) % i
            }
        }
        
        return number
    }

    
    func normalLastNumber(n:Int,m:Int) -> Int {
        if n < 1 || m < 1 {
            return -1
        }
        
        var number:Int = 0
        
        if n >= 2 {
            var arr:[Int] = []
            
            for i in 0..<n {
                arr.append(i)
            }
            
            var position:Int = 0
            while arr.count > 1 {
                for j in 0..<m {
                    if j == m - 1 {
                        arr.remove(at: position)
                        position -= 1
                    }
                    if position == arr.count - 1{
                        position = 0
                    } else {
                        position += 1
                    }
                }
            }
            number = arr[0]
        }
        
        return number
    }
}
