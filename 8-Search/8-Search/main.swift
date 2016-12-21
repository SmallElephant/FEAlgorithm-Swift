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

