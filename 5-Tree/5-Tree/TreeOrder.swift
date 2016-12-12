//
//  TreeOrder.swift
//  5-Tree
//
//  Created by keso on 16/6/26.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

class TreeOrder {
    
    func preOrder(_ rootNode:TreeNode?) -> Void {
        if rootNode != nil {
            if let data = rootNode?.data {
                print("\(data)\t", terminator: "")
                preOrder(rootNode?.leftChild)
                preOrder(rootNode?.rightChild)
            }
        }
    }
    
    func inOrder(_ rootNode:TreeNode?) -> Void {
        if rootNode != nil {
            if let data = rootNode?.data {
                inOrder(rootNode?.leftChild)
                print("\(data)\t", terminator: "")
                inOrder(rootNode?.rightChild)
            }
        }
    }
    
    // 后序输出
    func postOrder(_ rootNode:TreeNode?) -> Void {
        if rootNode != nil {
            if let data = rootNode?.data {
                postOrder(rootNode?.leftChild)
                postOrder(rootNode?.rightChild)
                print("\(data)\t", terminator: "")
            }
        }
    }
    
    // 层级排序
    func levelOrder(_ rootNode:TreeNode?) -> Void {
        var arr:[AnyObject]=[];
        arr.append(rootNode!);
        
        while arr.count > 0 {
            let firstNode=arr[0] as! TreeNode
            
            if let data = firstNode.data {
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
}
