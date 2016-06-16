//
//  main.swift
//  5-Tree
//
//  Created by FlyElephant on 16/6/12.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation



func preOrder(rootNode:TreeNode?) -> Void {
    if rootNode != nil {
        if let data = rootNode?.data {
            print("\(data)\t", terminator: "")
            preOrder(rootNode?.leftChild)
            preOrder(rootNode?.rightChild)
        }
    }
}

func inOrder(rootNode:TreeNode?) -> Void {
    if rootNode != nil {
        if let data = rootNode?.data {
            inOrder(rootNode?.leftChild)
            print("\(data)\t", terminator: "")
            inOrder(rootNode?.rightChild)
        }
    }
}

func postOrder(rootNode:TreeNode?) -> Void {
    if rootNode != nil {
        if let data = rootNode?.data {
            postOrder(rootNode?.leftChild)
            postOrder(rootNode?.rightChild)
            print("\(data)\t", terminator: "")
        }
    }
}

func levelOrder(rootNode:TreeNode?) -> Void {
    var arr:[AnyObject]=[];
    arr.append(rootNode!);
    
    while arr.count>0 {
        let firstNode=arr[0] as! TreeNode
        
        if let data=firstNode.data {
            print("\(data)\t", terminator: "")
            arr.removeFirst()
        }
        
        if (firstNode.leftChild != nil) {
            arr.append(firstNode.leftChild!)
        }
        
        if (firstNode.rightChild != nil) {
            arr.append(firstNode.rightChild!)
        }
    }
}


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

var constructTree = ConstructBinaryTree()
var rePreOrder:[String] = ["1","2","4","7","3","5","6","8"]
var reInOrder:[String] = ["4","7","2","1","5","3","8","6"]
var rePostOrder:[String] = ["7","4","2","5","8","6","3","1"]
var constructRoot = constructTree.reConstructForPost(rePreOrder, inOrder: reInOrder)
print("FlyELephant")
print("先序和中序输出后序:")
postOrder(constructRoot)

var preRoot = constructTree.reConstructForPre(reInOrder, postOrder: rePostOrder)
print("\n中序和后序输出先序:")
preOrder(preRoot)
print("")






