//
//  main.swift
//  2-Dynamic
//
//  Created by keso on 2017/2/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

var values:[Int] = [0, 60, 100, 120] //为了理解第0个设置为0

var weights:[Int] = [0, 10, 20, 30]

values = [0,6,3,5,4,6]

weights = [0,2,2,6,5,4]

var max:Int = 10

var bag:Bag = Bag.init(maxW: max, value: values , weight: weights)

var maxValue = bag.solveMaxValue()

print("FlyElephant---01背包最大的值----\(maxValue)")

var maxValue2 = bag.solveMaxValue2()
print("Fylephant---01背包最大值为---\(maxValue2)")

var maxValue3 = bag.solveMaxValue3()
print("FlyElephant---完全背包最大值为---\(maxValue3)")

var personFloor:[Int] = [0 ,2 , 3, 5, 10, 8, 6]
var elevator:Elevator = Elevator()
var result = elevator.compute(person: personFloor, maxFloor: 6)
print("FlyElephant-走的最小的路层--\(result.0)--最佳楼层---\(result.1)")

var result2 = elevator.compute2(person: personFloor, maxFloor: 6)
print("FlyElephant-走的最小的路层--\(result2.0)--最佳楼层---\(result2.1)")

