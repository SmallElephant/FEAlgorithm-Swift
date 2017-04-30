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
print("FlyElephant--链表切分1")
var partitionHeadNode:ListNode = listNodeManger.partitionListNode(node: listNodeManger.headNode!, x: 5)
listNodeManger.printListNode(headNode: partitionHeadNode)
print("FlyElephant--链表切分2")
partitionHeadNode = listNodeManger.partitionListNode2(node: listNodeManger.headNode!, x: 5)
listNodeManger.printListNode(headNode: partitionHeadNode)

listNodeManger.headNode = nil

listNodeManger.appendToTail(value: "\(0)")
listNodeManger.appendToTail(value: "\(5)")
listNodeManger.appendToTail(value: "\(2)")
listNodeManger.appendToTail(value: "\(7)")

var addHeadNode1:ListNode = listNodeManger.headNode!
listNodeManger.headNode = nil

listNodeManger.appendToTail(value: "\(7)")
listNodeManger.appendToTail(value: "\(8)")
listNodeManger.appendToTail(value: "\(9)")

var addHeadNode2:ListNode = listNodeManger.headNode!

var addResultNode:ListNode = listNodeManger.addListNode(node1: addHeadNode1, node2: addHeadNode2)
print("FlyElephant---链表原始数据")
listNodeManger.printListNode(headNode: addHeadNode1)
listNodeManger.printListNode(headNode: addHeadNode2)
print("FlyElephant---相加之后结果")
listNodeManger.printListNode(headNode: addResultNode)

var addResultNode2:ListNode? = listNodeManger.addListNode1(node1: addHeadNode1, node2: addHeadNode2, carry: 0)
print("FlyElephant---相加之后结果2")
listNodeManger.printListNode(headNode: addResultNode2!)

var listCount:Int = listNodeManger.listNodeCount(listNode: addHeadNode2)
print("链表的长度---\(listCount)")
var addHeadNode3:ListNode = listNodeManger.paddingListNode(node: addHeadNode2, padding: 2)
listNodeManger.printListNode(headNode: addHeadNode3)

listNodeManger.headNode = nil

listNodeManger.appendToTail(value: "\(9)")
listNodeManger.appendToTail(value: "\(5)")
listNodeManger.appendToTail(value: "\(8)")

var sequenceHeadNode1:ListNode! = listNodeManger.headNode

listNodeManger.headNode = nil
listNodeManger.appendToTail(value: "\(8)")
listNodeManger.appendToTail(value: "\(7)")

var sequenceHeadNode2:ListNode! = listNodeManger.headNode

var sequenceHeadNode3:ListNode? = listNodeManger.addListNode3(node1: sequenceHeadNode1, node2: sequenceHeadNode2)
print("FlyElephant---正向相加结果")
listNodeManger.printListNode(headNode: sequenceHeadNode3!)

var circleHead:ListNode = ListNode(value: "1")
var circelNode1:ListNode = ListNode(value: "2")
var circelNode2:ListNode = ListNode(value: "3")
var circelNode3:ListNode = ListNode(value: "4")
circleHead.next = circelNode1
circelNode1.next = circelNode2
circelNode2.next = circelNode3
circelNode3.next = circleHead
var beginingNode:ListNode? = listNodeManger.findBeginingNode(headNode: circelNode1)
print("FlyElephant---环路链表开始值---\(beginingNode!.value!)")


listNodeManger.headNode = nil

listNodeManger.appendToTail(value: "\(1)")
listNodeManger.appendToTail(value: "\(2)")
listNodeManger.appendToTail(value: "\(3)")
listNodeManger.appendToTail(value: "\(2)")
listNodeManger.appendToTail(value: "\(1)")

var isRome:Bool = listNodeManger.isPalindrome(node: listNodeManger.headNode!)
if isRome {
    print("FlyElephant---回文链表")
} else {
    print("FlyElephant---非回文链表")
}

isRome = listNodeManger.isPalindrome1(node: listNodeManger.headNode!)
if isRome {
    print("FlyElephant---回文链表")
} else {
    print("FlyElephant---非回文链表")
}
