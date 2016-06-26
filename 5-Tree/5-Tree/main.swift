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
let rootList="ABD##E##CF###"
var rootIndex = -1
//二叉树创建
func createTree(inout root:TreeNode?) -> Void {
    
    rootIndex=rootIndex+1
    
    if rootIndex>=rootList.characters.count {
        return
    }
    
    let data=rootList[rootIndex] as String
    if data != "#" {
        root = TreeNode()
        root?.data = data
        
        createTree(&root!.leftChild)
        createTree(&root!.rightChild)
    } else {
        root = nil
    }
}


//var rootNode:TreeNode?
//createTree(&rootNode)
//print("FlyElephant")
//print("先序遍历:")
//preOrder(rootNode)
//print("\n中序遍历:")
//inOrder(rootNode)
//print("\n后序遍历:")
//postOrder(rootNode)
//print("\n层次遍历:")
//levelOrder(rootNode)
//print()
//
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

func binaryPosition(position:NSInteger)->NSInteger {
    var result=1
    for _  in 0..<position {
        result = result*2
    }
    return result
}

func convertBinaryToDecimal(binaryNumber:String)->NSInteger {
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

func convertNumberToHex(number:NSInteger)->String{
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

var binaryNumber="1111"
var resultValue=convertBinaryToDecimal(binaryNumber)
print("\(binaryNumber)的值:\(resultValue)")

var binaryHex=convertNumberToHex(resultValue)
print("FlyElephant:\(binaryHex)")




