//
//  Sum.swift
//  9-Array
//
//  Created by FlyElephant on 17/1/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Sum {
    
    //求1+2+…+n,要求不能使用乘除法、for、while、if、else...
    //题目：求1+2+…+n， 要求不能使用乘除法、for、while、if、else、switch、case等关键字以及条件判断语句（A?B:C).
    func sumNumber(n:Int)->Int {
        
        guard n > 0 else {
            return 0
        }
        return  n + sumNumber(n: n-1)
    }
    
     // var sum:Int = 0;
      //n > 0 && (sum = n + sumNumber(n - 1))
      //return sum
    
      //var sum:Int = 0;
      //n == 0 || (sum = n + sumNumber(n - 1))
      //return sum
    //不用加减乘除做加法
    //题目:写一个函数，求两个整数之和，要求在函数体内不得使用+、-、*、/四则运算符号.
    func add(num1:Int,num2:Int) -> Int {
        var a:Int = num1
        var b:Int = num2
        while b != 0 {
            let temp:Int = a ^ b
            b = (a & b) << 1
            a = temp
        }
        return a
    }
    
}
