//
//  StackMin.swift
//  3-Fibonacci
//
//  Created by FlyElephant on 16/12/13.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

//题目：定义栈的数据结构，要求添加一个min函数，能够得到栈的最小元素。要求函数min、push以及pop的时间复杂度都是O(1)。
class StackMin {

    var stack:[Int] = []
    var minStack:[Int] = []
    
    func push(node:Int) {
        stack.append(node)
        if minStack.count > 0 {
            let lastNode:Int = minStack[minStack.count-1]
            if lastNode < node {
                minStack.append(lastNode)
            } else {
                minStack.append(node)
            }
        } else {
            minStack.append(node)
        }
    }
    
    func pop() -> Int? {
        let index:Int = minStack.count - 1
        if index < 0  {
            return nil
        }
        let value:Int = stack[index]
        stack.remove(at: index)
        minStack.remove(at: index)
        return value
    }
    
    func min() -> Int? {
        let index:Int = minStack.count - 1
        if index < 0  {
            return nil
        }
        let value:Int = minStack[index]
        return value
    }
}
