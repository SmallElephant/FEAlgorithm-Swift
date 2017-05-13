//
//  Tree.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class TreeNode {
    
    var data:String?
    
    var leftChild:TreeNode?
    
    var rightChild:TreeNode?
    
}

class Tree {
    
    var rootIndex:Int = -1
    
    // 先序集合创建二叉树
    
    func createTreeByPreOrder(root:inout TreeNode?,listData:[String]) {
        
        rootIndex = rootIndex + 1
        
        if rootIndex >= listData.count {
            return
        }
        
        let data:String = listData[rootIndex] as String
        
        if data == "#" {
            root = nil
        } else {
            root = TreeNode()
            root?.data = data
            createTreeByPreOrder(root: &root!.leftChild, listData: listData)
            createTreeByPreOrder(root: &root!.rightChild, listData: listData)
        }
        
    }
    
    // 层次遍历
    
    func treeLevelOrder(root:TreeNode?) {
        
        if root == nil {
            return
        }
        
        var arr:[TreeNode] = []
        arr.append(root!)
        
        while arr.count > 0 {
            
            let firstNode:TreeNode = arr[0]
            
            if firstNode.data != nil {
                print("\(firstNode.data!)\t", terminator: "")
                arr.removeFirst()
            }
            
            
            if firstNode.leftChild != nil {
                arr.append(firstNode.leftChild!)
            }
            
            
            if firstNode.rightChild != nil {
                arr.append(firstNode.rightChild!)
            }

        }
        
        print("")
    }
    
    
}
