//
//  main.swift
//  12-LeetCode
//
//  Created by keso on 2017/5/29.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

var myArray:MyArray = MyArray()
var nums:[Int] = [1, 1, 2, 5, 6, 6, 7]
var len:Int = myArray.removeDuplicates(&nums)
print("长度:\(len)---\(nums)")

