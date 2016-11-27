//
//  main.swift
//  1-SearchForDimension
//
//  Created by keso on 16/6/10.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

var data=[[1,2,6,9],[2,4,9,12],[4,7,10,13],[6,8,11,15]]
var search=SearchDimension()
var number=6
var isExist = search.searchNumber(data, number: number)
print("FlyElephant:data contains \(number) is \(isExist)")

