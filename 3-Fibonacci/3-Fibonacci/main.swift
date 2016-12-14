//
//  main.swift
//  3-Fibonacci
//
//  Created by keso on 16/6/11.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

var dimensionData = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
//var dimensionData = [[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18],[19,20,21,22,23,24]]
//dimensionData = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]
dimensionData = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
var rows = dimensionData.count
var cols = dimensionData[0].count
var dimension:Dimension = Dimension();
dimension.printMatrixClockwisly(data: dimensionData, rows: rows, cols: cols)
print()
//var test = dimensionData[3][2]
//print("\(test)")

var arr:[Int] = []

arr.append(10)
arr.append(20)
print(arr)
arr.remove(at: arr.count-1)
print(arr)
//包含min函数的栈
var minStack:StackMin = StackMin()
minStack.push(node: 30)
minStack.push(node: 40)
minStack.push(node: 20)
minStack.push(node: 10)
minStack.push(node: 50)

print(minStack.stack)
print(minStack.minStack)
print("最小值--\(minStack.min()!)")

print("pop--\(minStack.pop()!)")
print("最小值--\(minStack.min()!)")

print("pop--\(minStack.pop()!)")
print("最小值--\(minStack.min()!)")

//栈的压入、弹出序列
var pushData:[Int] = [1,2,3,4,5]
var popData:[Int] = [4,3,2,1,0]
var stackOrder:StackOrder = StackOrder()

var popResult:Bool = stackOrder.isPopOrder(push: pushData, pop: popData)
if popResult {
    print("\(popData)是\(pushData)栈的pop子序列")
} else {
    print("\(popData)不是\(pushData)栈的pop子序列")
}






