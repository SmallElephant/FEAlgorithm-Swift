//
//  Bag.swift
//  2-Dynamic
//
//  Created by keso on 2017/2/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Bag {
    
    var values:[Int] = []
    var weights:[Int] = []
    var maxWeight:Int = 0
    var calculate:[[Int]] = []
    
    
    init(max:Int,value:[Int],weight:[Int]) {
        maxWeight = max
        values = value
        weights = weight
        let temp:[Int] = [Int].init(repeating: 0, count: maxWeight + 1)
        calculate = [[Int]].init(repeating: temp, count: values.count)
    }
//    http://shmilyaw-hotmail-com.iteye.com/blog/2009761
    func solveMaxValue()->Int {
        
        for i in 1..<values.count {
            for j in 1...maxWeight {
                if weights[i] <= j {
                    let currentValue:Int = values[i] + calculate[i - 1][j - weights[i]]
                    let preValue:Int = calculate[i-1][j]
                    calculate[i][j] = currentValue > preValue ? currentValue : preValue;
                } else {
                    calculate[i][j] = calculate[i - 1][j]
                }
            }
        }
        return calculate[values.count - 1][maxWeight]
    }
    
}
