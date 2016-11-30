//
//  main.swift
//  3-Fibonacci
//
//  Created by keso on 16/6/11.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

//0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233……

func fibonacci(n:NSInteger)->NSInteger{
    if n<=0 {
        return 0
    }
    if n==1 || n==2 {
        return 1
    }
    return fibonacci(n-1)+fibonacci(n-2)
}

for index in 0...13 {
    print("第\(index)项的值:\(fibonacci(index))")
}

//一只青蛙一次可以跳上 1 级台阶，也可以跳上2 级。青蛙跳上一个n级的台阶总共有多少种跳法。

func jumpFloor(n:NSInteger)->NSInteger {
    if n<=0 {
        return 0
    }
    
    if n==1 {
        return 1
    }
    
    if n==2 {
        return 2
    }
    
    return jumpFloor(n-1)+jumpFloor(n-2)
}

for index in 1...10 {
    print("\(index)级台阶的跳法:\(jumpFloor(index))")
}

//一只青蛙一次可以跳上1级台阶，也可以跳上2 级……也可以跳上n 级，青蛙跳上一个n级的台阶总共有多少种跳法？

func jumpLoopFloor(n:NSInteger)->NSInteger {
    if n<=0 {
        return 0
    }
    
    if n==1 {
        return 1
    }
    
    return 2*jumpLoopFloor(n-1)
}

for index in 1...10 {
    print("\(index)级台阶跳法:\(jumpLoopFloor(index))")
}


