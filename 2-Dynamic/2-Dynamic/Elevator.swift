//
//  Elevator.swift
//  2-Dynamic
//
//  Created by keso on 2017/2/25.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


class Elevator {
    
    var person:[Int] = []
    
    
    func compute(person:[Int],maxFloor:Int) -> (Int,Int) {
    
        var minFloor:Int = 0
        var targetFloor:Int = 0
        
        for i in 1...maxFloor { // 电梯停留在i层
            var temp:Int = 0
            for j in 1...maxFloor {
                temp += person[j] * abs(i - j)
            }
            
            if i == 1 {
                minFloor = temp
                targetFloor = 1
            } else {
                if temp < minFloor {
                    minFloor = temp
                    targetFloor = i
                }
            }
        }
        
        return (minFloor,targetFloor)
    }
    
    
    func compute2(person:[Int],maxFloor:Int) -> (Int,Int) {
        var n1:Int = 0 // 第i层以下的人数
        var n2:Int = person[1] // 第i层的人数
        var n3:Int = 0 // 第i层以上的人数
        var countFloor:Int = 0 // 第i层的时候所走的楼层总数
        var targetFloor:Int = 1

        for i in 2...maxFloor {
            countFloor += person[i] * (i - 1)
            n3 += person[i]
        }
        
        // 如果楼层变为i-1层 总层为 count + (n2 + n3 - n1)
        // 如果楼层变为i+1层 总层为 count + (n1 + n2 - n3)
        for i in 2...maxFloor {
            if n1+n2 < n3 {
                targetFloor = i
                countFloor += n1 + n2 - n3
                n1 += n2 //n1 增加
                n2 = person[i]
                n3 -= person[i] // n3 减少
            } else {
                break
            }
        }
        
        return (countFloor,targetFloor)
    }
    
    
}
