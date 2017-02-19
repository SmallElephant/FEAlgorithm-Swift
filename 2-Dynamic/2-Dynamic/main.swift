//
//  main.swift
//  2-Dynamic
//
//  Created by keso on 2017/2/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

var bag:Bag = Bag.init(max: 50, value:  [0, 60, 100, 120], weight: [0, 10, 20, 30])

var maxValue = bag.solveMaxValue()

print("最大的值----\(maxValue)")

