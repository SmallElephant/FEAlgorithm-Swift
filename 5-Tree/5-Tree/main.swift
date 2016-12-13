//
//  main.swift
//  5-Tree
//
//  Created by FlyElephant on 16/6/12.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

var d = TreeNode(data: "d",leftChild: nil,rightChild: nil)

var b = TreeNode(data: "b",leftChild: nil,rightChild: d)

var e = TreeNode(data: "e",leftChild: nil,rightChild: nil)

var c = TreeNode(data: "c", leftChild: nil, rightChild: e)

var a = TreeNode(data: "a",leftChild: b,rightChild: c)

//print("FlyElephant")
//print("先序遍历:")
//preOrder(a)
//print("\n中序遍历:")
//inOrder(a)
//print("\n后序遍历:")
//postOrder(a)
//print()

//let rootList="ab#d##c#e##"


//var constructTree = ConstructBinaryTree()
//var rePreOrder:[String] = ["1","2","4","7","3","5","6","8"]
//var reInOrder:[String] = ["4","7","2","1","5","3","8","6"]
//var rePostOrder:[String] = ["7","4","2","5","8","6","3","1"]
//var constructRoot = constructTree.reConstructForPost(rePreOrder, inOrder: reInOrder)
//print("FlyELephant")
//print("先序和中序输出后序:")
//postOrder(constructRoot)
//
//var preRoot = constructTree.reConstructForPre(reInOrder, postOrder: rePostOrder)
//print("\n中序和后序输出先序:")
//preOrder(preRoot)
//print("")



func hexPosition(_ position:NSInteger)->NSInteger {
    var result=1
    for _  in 0..<position {
        result = result*16
    }
    return result
}

func converHexToDecimal(_ number:String,radix:NSInteger)->NSInteger? {
    let digits = "0123456789abcdefghijklmnopqrstuvwxyz"
    var result=0
    for digit in number.lowercased().characters {
        if let range = digits.range(of: String(digit)) {
            let index: Int = digits.characters.distance(from: digits.startIndex, to: range.lowerBound)
            if index>radix {
                return nil
            }
            result=result*radix+index
        }
    }
    return result
}

func binaryPosition(_ position:NSInteger)->NSInteger {
    var result=1
    for _  in 0..<position {
        result = result*2
    }
    return result
}

func convertBinaryToDecimal(_ binaryNumber:String)->NSInteger {
    var result=0
    var temp:NSInteger
    var power:NSInteger
    for index in 0..<binaryNumber.characters.count {
        temp = Int(binaryNumber[index] as String)!
        power = binaryNumber.characters.count-1-index
        result = result+temp*binaryPosition(power)
    }
    return result
}

func convertNumberToHex(_ number:NSInteger)->String{
    if number<=0 {
        return "0"
    }
    var result:String = ""
    var num = number
    while(num != 0){
        result=String(num%2)+result
        num=num/2
    }
    return result
}

//var binaryNumber="1111"
//var resultValue=convertBinaryToDecimal(binaryNumber)
//print("\(binaryNumber)的值:\(resultValue)")
//
//var binaryHex=convertNumberToHex(resultValue)
//print("FlyElephant:\(binaryHex)")
//
//var test=Int("a")
//print("\(test)")

var convert=String(100,radix:16)
print("100的进制值:\(convert)")

var  decimalNumber=converHexToDecimal(convert, radix: 16)
print("\(convert)的十进制\(decimalNumber!)")

//var util:TreeUtil = TreeUtil()
//var rootStr:String = "124##5##36##7##"
//var preRootNode:TreeNode?
//util.rootList = rootStr
//util.createTreeByPreOrder(root: &preRootNode)
//
//var treeOrder:TreeOrder = TreeOrder()
//
//var mirrorTree:MirrorTree = MirrorTree()
//mirrorTree.mirrorTree(rootNode: &preRootNode)
//print("镜像")
//treeOrder.levelOrder(preRootNode)
//print()
//
//treeOrder.preOrder(preRootNode)
//print()
//
//treeOrder.inOrder(preRootNode)
//print()
//treeOrder.postOrder(preRootNode)
//print()
//
//treeOrder.levelOrder(preRootNode)
//print()

var util:TreeUtil = TreeUtil()
var rootData:[String] = ["8","6","5","#","#","7","#","#","10","9","#","#","11","#","#"]
var preRootNode:TreeNode?
util.createTreeByPreOrderData(root: &preRootNode, listData: rootData)

var treeOrder:TreeOrder = TreeOrder()
var leveData:[String]? = treeOrder.levelOrderTree(rootNode: preRootNode)
print("层级数组--\(leveData!)")
print()


func isOdd(number:Int) -> Bool {
    return (number & 1) == 0
}

func reSortData(arr:inout [Int],conditionFunc:(Int)->Bool)  {
    if arr.count == 0 {
        return
    }
    var start:Int = 0
    var end:Int = arr.count - 1
    while start < end {
        while start < end && !conditionFunc(arr[start]) {// 直接到偶数              
            start += 1
        }
        while start < end && conditionFunc(arr[end]) {
            end -= 1
        }
        if start < end {
            swap(&arr[start], &arr[end])
        }
    }
}

var sortData:[Int] = [10,3,2,8,4,2,5,7,9]
reSortData(arr: &sortData,conditionFunc: isOdd)
print("(sortData)")





























