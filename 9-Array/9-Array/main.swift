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
print("FlyElephant-连续子数组最大的和--\(sum)")
