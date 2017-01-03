//
//  main.swift
//  8-Search
//
//  Created by FlyElephant on 16/12/21.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

print("Hello, World!")

var searchMin:SearchMin = SearchMin()
var data:[Int] = [4,5,1,6,2,7,3,8]
var k:Int = 4
var result:[Int] = searchMin.leastMinNumbers(arr: data, k: k)
print("最小的\(k)个数---\(result)")


var searchArr:[Int] = [1,2,3,4,4,5,6,7,9,10]
var binarySearch:BinarySearch = BinarySearch()
var target:Int = 4
var binaryResult:Int? = binarySearch.binarySearchNumber(arr: searchArr, num: target)
if binaryResult == nil {
    print("\(searchArr)不存在数字-\(target)")
} else {
    print("\(searchArr)中数字-\(target)的位置--\(binaryResult!)")
}


var sortArr:[Int] = [1,2,3,3,3,3,4,5]
var sortTarget:Int = 1
var sortCount:Int? = binarySearch.searchNumberOfK(arr: sortArr, num: sortTarget)
if sortCount == nil {
    print("FlyElephant-\(sortArr)不存在数字-\(sortTarget)")
} else {
    print("FlyElephant-\(sortArr)中数字-\(sortTarget)的次数--\(sortCount!)")
}


