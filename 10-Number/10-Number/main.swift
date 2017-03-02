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

var targetArr = FEArray()
var data:[Int] = [1,1,3,4,1,5,1]
var arrResult:Int?  = targetArr.moreThanHalfNumber(arr: data)
if arrResult != nil {
    print("\(data)超过一半的数字是---\(arrResult!)")
}

var statis:Statistics = Statistics()
var maxNum:Int = 123
var statisResult:Int = statis.sumls(num: maxNum)
var statisResult2:Int = statis.sumlsSimple(num: maxNum)
var statisResult3:Int = statis.sumlsCommon(num: maxNum, target: 2)
print("FlyElephant--1...\(maxNum)中1的个数---\(statisResult)---\(statisResult2)")
print("FlyElephant--1...\(maxNum)中2的个数---\(statisResult3)")


var bigNumber:BigNumber = BigNumber()
//var bigData:[Int] = [3,4,8,100,3,2,5,1]
var bigData:[Int] = [3,4,8,3,5,10,2]
bigNumber.quickSort(arr: &bigData, low: 0, high: bigData.count - 1)
print("排序之后的数组--\(bigData)")

var kData:[Int] = [1,2,3,4,8,3,2,5,10,100,30]

print("排序之前的数组----\(kData)")
kData = [4,5,1,6,2,7,3,8]
kData = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17, 20]
var bigIndex:Int = -1
bigIndex = bigNumber.kBigNumber(arr: &kData, low: 0, high: kData.count - 1, k: 4)
if bigIndex >= 0 {
    for i in 0...bigIndex {
        print("最大的k个数---\(kData[i])")
    }
    print("\(kData)")
}











