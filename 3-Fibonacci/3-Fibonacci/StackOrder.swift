//
//  StackOrder.swift
//  3-Fibonacci
//
//  Created by FlyElephant on 16/12/13.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

//题目:输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如序列1,2,3,4,5是某栈的压入顺序，序列4，5,3,2,1是该压栈序列对应的一个弹出序列，但4,3,5,1,2就不可能是该压栈序列的弹出序列.

class StackOrder {

    func isPopOrder(push:[Int],pop:[Int]) -> Bool {
        if push.count == 0 || pop.count == 0 {
            return false
        }
        var result = false
        var popIndex:Int = 0
        var pushData = push
        var popData = pop
        while pushData.count > 0 {
            if pushData.count == popData.count && pushData[pushData.count-1] != popData[0]  {
                result = false
                break
            }
            if pushData[pushData.count-1] == popData[popIndex] {
                popIndex += 1
                pushData.remove(at: pushData.count-1)
                if popIndex == popData.count {
                    result = true
                    break
                }
            } else {
                pushData.remove(at: pushData.count-1)
            }
        }
        return result
    }
}
