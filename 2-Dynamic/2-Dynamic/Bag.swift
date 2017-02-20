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
    var calculate2:[Int] = []
    var calculate3:[Int] = []
    
    init(maxW:Int,value:[Int],weight:[Int]) {
        maxWeight = maxW
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
                    calculate[i][j] = maxCompare(a: values[i] + calculate[i - 1][j - weights[i]], b: calculate[i-1][j])
                } else {
                    calculate[i][j] = calculate[i - 1][j]
                }
            }
        }
        return calculate[values.count - 1][maxWeight]
    }
    
    func solveMaxValue2()->Int {
        calculate2 = [Int].init(repeating: 0, count: maxWeight + 1)
        
        for i in 1..<values.count {
            for j in (1...maxWeight).reversed() {
                if weights[i] <= j {
                    calculate2[j] = maxCompare(a:  calculate2[j], b:  (calculate2[j-weights[i]]+values[i]))
                }
            }
        }
        return calculate2[maxWeight]
    }
    
    func solveMaxValue3()->Int {
        calculate3 = [Int].init(repeating: 0, count: maxWeight + 1)
        
        for i in 1..<values.count {
            for j in 1...maxWeight {
                if weights[i] <= j {
                    calculate3[j] = maxCompare(a:  calculate3[j], b:  (calculate3[j-weights[i]]+values[i]))
                }
            }
        }
        return calculate3[maxWeight]
    }
    
    func printResult() {
        for i in 1..<values.count {
            for j in 1...maxWeight {
                print("\(i)--\(j)的结果---\(calculate[i][j])")
            }
        }
    }
    
    func printResult2() {
        for j in 1...maxWeight {
            print("\(j)的结果---\(calculate2[j])")
        }
    }
    
    func maxCompare(a:Int,b:Int) -> Int {
        return a > b ? a : b
    }
    
}
