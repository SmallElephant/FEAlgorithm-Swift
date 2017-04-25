//
//  main.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/4/15.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


var myString:MyString = MyString()

var uniqueStr:String = "FlyElephant"

var isUnique:Bool = myString.isUniqueChar(str: uniqueStr)

print("\(uniqueStr)---是不是所有字符串唯一:\(isUnique)")

var reverseTemp:String = "FlyElephant"
var reverseStr:String = myString.reverseString(str: reverseTemp)
print("反转字符串:\(reverseStr)---\(String(reverseTemp.characters.reversed()))")

var strA:String = "student"
var strB:String = "FlyElephant"
var perResult:Bool = myString.permutation(strA: strA, strB: strB)
print("\(strA)与\(strB)是不是变位词\(perResult)")


var replaceStr:String = "I am FlyElephant"
var replaceResult:String = myString.replaceSpaces(str: replaceStr)
print("字符串空格替换:\(replaceResult)")

var result2:String = myString.replaceSpaces1(str: replaceStr)
print("字符串空格替换:\(result2)")


var compressString:String = "abbcccdddd"
var compressResult:String = myString.compressBetter(str: compressString)
print("压缩结果:\(compressResult)")

var rotateData:[[Int]] = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
myString.rotate(data: &rotateData, n: 4)
print("FlyElephant--数组旋转90度数据---\(rotateData)")

var clearData:[[Int]] = [[1,2,3,4,0],[5,6,7,8,9],[9,10,11,12,1],[13,14,15,16,17]]
myString.clearZero(data: &clearData)
print("FlyElephant--数组清零--\(clearData)")


var originalStr:String = "FlyElephant"
var rotationStr:String = "antFlyEleph"
var result:Bool = myString.isRotation(orginal: originalStr, rotation: rotationStr)
print("\(rotationStr)是\(originalStr)的结果\(result)")


var listNodeManger:ListNodeManger = ListNodeManger()

for i in 0..<10 {
    listNodeManger.appendToTail(value: "\(i)")
}

for i in 0..<3 {
    listNodeManger.appendToTail(value: "\(i)")
}

listNodeManger.printListNode(headNode: listNodeManger.headNode!)

listNodeManger.deleteDuplitation(node: listNodeManger.headNode!)
print("删除重复结点")

listNodeManger.printListNode(headNode: listNodeManger.headNode!)



var nthNode:ListNode? = listNodeManger.nthToLastNode(node: listNodeManger.headNode!, k: 3)
if nthNode != nil {
    print("FlyElephant--倒数的k个节点:\(nthNode!.value!)")
}


listNodeManger.headNode = nil

listNodeManger.appendToTail(value: "\(1)")
listNodeManger.appendToTail(value: "\(3)")
listNodeManger.appendToTail(value: "\(5)")
listNodeManger.appendToTail(value: "\(2)")
listNodeManger.appendToTail(value: "\(4)")
listNodeManger.appendToTail(value: "\(6)")
listNodeManger.appendToTail(value: "\(8)")
listNodeManger.appendToTail(value: "\(7)")
listNodeManger.appendToTail(value: "\(9)")


listNodeManger.printListNode(headNode: listNodeManger.headNode!)
print("开始进行链表切分")
var partitionHeadNode:ListNode = listNodeManger.partitionListNode(node: listNodeManger.headNode!, x: 5)
listNodeManger.printListNode(headNode: partitionHeadNode)






