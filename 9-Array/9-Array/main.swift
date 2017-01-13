//
//  main.swift
//  9-Array
//
//  Created by FlyElephant on 16/12/23.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

var maxSum:MaxSum = MaxSum()
var arr:[Int] = [1,-2,3,10,-4,7,2,-5]
var sum = maxSum.findGreatestSumOfSubArray(arr: arr)
print("连续子数组最大的和--\(sum)")

func countNumOfOne(num:Int) -> Int {
    var n:Int = num
    var count:Int = 0
    while n > 0 {
        if n%10 == 1 {
            count += 1
        }
        n = n/10
    }
    return count
}

func isUglyNumber(num:Int) -> Bool {
    var number:Int = num
    while number%2 == 0 {
        number = number/2
    }
    
    while number%3 == 0 {
        number = number/3
    }
    
    while number%5 == 0 {
        number = number/5
    }
    
    return number == 1 ? true : false
}

var maxNumber = 2000

var maxCount = maxSum.countOfNumber(num: maxNumber)
print("第二种方式----\(maxCount)")

var minSort:MinSort = MinSort()
var data:[Int] = [8,9,12,34,567]
minSort.printMinNumber(data: data)

var uglyNumber:Int = 1
var result:Bool = isUglyNumber(num: uglyNumber)
print("\(uglyNumber)----\(result)")

//var uglyNumber:Int = 31
//var result:Int = minSort.findUglyNumber(index: 1500)
//print("FlyElephant-最终的结果---\(result)")
//for i in 1...15 {
//    var result:Int = minSort.findUglyNumber(index: i)
//    print("最终的结果---\(result)")
//}

//var reversePair:ReversePairs = ReversePairs()
//var sortData:[Int] = [7,5,6,4]
//var reverseCount:Int = reversePair.reversPairs(arr: &sortData, low: 0, high: sortData.count-1)
//print("FlyElephant-逆序对的数量---\(reverseCount)")
var searchNumber:SearchNumber = SearchNumber()

var searchIndex:Int = searchNumber.indexOfOne(num: 8)
print("1的位置---\(searchIndex)")
var searchArr:[Int] = [2,4,4,7,3,2,5,5]
var searchResult:(Int,Int) = searchNumber.findNumberAppearOnce(arr: searchArr)
print("\(searchArr)出现一次的两个数字---\(searchResult)")

var searchSum:SearchSum = SearchSum()
var sumArr:[Int] = [1,2,4,7,11,15]
var sumTarget:Int = 15
var sumResult:(Int,Int)? = searchSum.findNumber(arr: sumArr, sum: sumTarget)
if sumResult != nil {
    print("\(sumResult!)和为\(sumTarget)")
}

sumResult = searchSum.findNumber(arr: sumArr, sum: sumTarget)
if sumResult != nil {
    print("\(sumResult!)和为\(sumTarget)")
}

var sumSequenceArr:[[Int]]? = searchSum.findContinuousSequence(sum: 15)
if sumSequenceArr != nil {
    print("连续正数序列数组--\(sumSequenceArr!)")
}

var dices:Dices = Dices()
dices.probility(diceCount: 3)
dices.diceProbility(diceCount: 3)



var playCard:PlayCard = PlayCard()
var playArr:[Int] = [1,0,0,6,5]
var playResult:Bool = playCard.isContinuous(arr: playArr)
if playResult {
    print("FlyElephant-\(playArr)是顺子")
} else {
    print("FlyElephant-\(playArr)不是顺子")
}



