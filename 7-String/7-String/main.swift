//
//  main.swift
//  7-String
//
//  Created by keso on 2016/12/18.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

print("Hello, World!")


var arr:[String] = ["a","b","c"]

var permutation:Permutation = Permutation()
permutation.full_permutation(arr: arr, begin: 0, end: arr.count)
print("FlyElephant--\(permutation.count)")

var str:String = "abc"
permutation.stringCombination(str: str)
