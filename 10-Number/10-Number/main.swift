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

var commonNumber:CommonNumber = CommonNumber()
var commonResult:Int = commonNumber.gcd(a: 720, b: 1248)
var commonResult2:Int = commonNumber.gcd1(a: 720, b: 1248)
var commonResult3:Int = commonNumber.gcd2(a: 720, b: 1248)

print("最大公约数---\(commonResult)----公约数---\(commonResult2)--公约数--\(commonResult3)")

var fibonacci:Fibonacci = Fibonacci()
var index:Int = 8
var fibonacciResult1 = fibonacci.fibonaccciCount(n: index)
var fibonacciResult2 = fibonacci.fibonaccciCount(n: index)
print("斐波那契数列的第\(index)项--\(fibonacciResult1)----\(fibonacciResult2)")


var find = Find()
var findArr:[Int] = [100,5,6,8,3,7,9,10,0,40,1,2]
var findResult1 = find.minMax(arr: findArr)
var findResult2 = find.minMax1(arr: findArr)
var findResult3 = find.minMax2(arr: findArr)

print("FlyElephant-最大最小的数值---\(findResult1)---最小数组--\(findResult2)---\(findResult3)")


var sumArr:[Int] =  [100,5,6,8,3,7,9,10,0,40,1,2]
find.quickSort(arr: &sumArr, low: 0, high: sumArr.count - 1)
var sumResult4:(Int,Int) = find.sumNumber(arr: sumArr, sum: 10)
print("FlyElephant---\(sumResult4)")

var calculator:Calculator = Calculator()
var calculatorData:[Int] = [2, 3, 4, 5, 6]
var calResult:Int = calculator.multiMaxValue(arr: calculatorData)
print("FlyElephant--子数组的最大乘积---\(calResult)")

var subData:[Int] = [1,-1,2,-3,4,-5,6,-7]
var sublen:Int = calculator.maxSubsequence(arr: subData)
print("\(subData)最长递增子序列长度:\(sublen)")

var reverseData:[String] = ["a","b","c","d","1","2","3","4"]
calculator.reverseArr(arr: &reverseData, k: 4)
print("数组移位的数据---\(reverseData)")





