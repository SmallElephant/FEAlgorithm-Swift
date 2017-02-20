//
//  main.swift
//  2-Dynamic
//
//  Created by keso on 2017/2/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

var values:[Int] = [0, 60, 100, 120]

var weights:[Int] = [0, 10, 20, 30]

values = [0,6,3,5,4,6]

weights = [0,2,2,6,5,4]

var max:Int = 10

var bag:Bag = Bag.init(maxW: max, value: values , weight: weights)

var maxValue = bag.solveMaxValue()

print("最大的值----\(maxValue)")

bag.printResult()

var maxValue2 = bag.solveMaxValue2()
print("最大值为---\(maxValue2)")
bag.printResult2()

var maxValue3 = bag.solveMaxValue3()
print("最大值为---\(maxValue3)")
