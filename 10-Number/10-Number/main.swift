//
//  main.swift
//  10-Number
//
//  Created by FlyElephant on 17/2/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

var factorial:Factorial = Factorial()

var result1 = factorial.compute1(num: 20)
print("FlyElephant-10进制0的个数---\(result1)")

var result2 = factorial.compute2(num: 20)

print("FlyElephant-10进制0的个数---\(result2)")

var result3 = factorial.lowestOne(num: 10)
print("FlyElephant-1的位置---\(result3)")

var result4 = factorial.lowestOne1(num: 10)
print("FlyElephant-1的位置---\(result4)")

var powerNum:Int = 64
var isPower = factorial.isPowerOfBinary(num: powerNum)
if isPower {
    print("\(powerNum)是2的整数次幂")
} else {
    print("\(powerNum)不是2的整数次幂")
}
