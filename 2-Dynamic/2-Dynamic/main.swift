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

var personFloor:[Int] = [0 ,2 , 3, 5, 10, 8, 6]
var elevator:Elevator = Elevator()
var result = elevator.compute(person: personFloor, maxFloor: 6)
print("走的最小的路层--\(result.0)--最佳楼层---\(result.1)")

var result2 = elevator.compute2(person: personFloor, maxFloor: 6)
print("走的最小的路层--\(result2.0)--最佳楼层---\(result2.1)")

