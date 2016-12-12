//
//  TreeUtil.swift
//  5-Tree
//
//  Created by FlyElephant on 16/12/12.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class TreeUtil {
    
    var rootIndex:Int = -1
    var rootList:String = ""
    func createBinaryTree(data:[String]) -> TreeNode? {
        if  data.count == 0 {
            return nil
        }
        
        var nodeList:[TreeNode?] = []
        var rootNode:TreeNode?
        for i in 0..<data.count {
            let node:TreeNode? =  TreeNode(data: data[i],leftChild: nil,rightChild: nil)
            if i == 0 {
                rootNode = node
            }
            nodeList.append(node)
        }
        
        for index in 0..<data.count/2 {
            let node:TreeNode? = nodeList[index]
            node?.leftChild = nodeList[index*2+1]
            node?.rightChild = nodeList[(index+1)*2]
        }
        return rootNode
    }

  //二叉树创建
    func createTreeByPreOrder(root:inout TreeNode?) -> Void {
        
        rootIndex=rootIndex+1
        
        if rootIndex >= rootList.characters.count {
            return
        }
        
        let data = rootList[rootIndex] as String
        if data != "#" {
            root = TreeNode()
            root?.data = data
            
            createTreeByPreOrder(root: &root!.leftChild)
            createTreeByPreOrder(root: &root!.rightChild)
        } else {
            root = nil
        }
        
    }

}
