//
//  MirrorTree.swift
//  5-Tree
//
//  Created by FlyElephant on 16/12/12.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation


class MirrorTree {
    //题目：请完成一个函数，输入一个二叉树，该函数输出它的镜像.
    func mirrorTree(rootNode:inout TreeNode?) -> Void {
        if rootNode == nil || (rootNode?.leftChild == nil && rootNode?.rightChild != nil) {
            return
        }
        let tempNode:TreeNode = rootNode!
        
        swap(&tempNode.leftChild, &tempNode.rightChild)
        
        if rootNode?.leftChild != nil {
            mirrorTree(rootNode: &tempNode.leftChild)
        }
        
        if rootNode?.rightChild != nil {
            mirrorTree(rootNode: &tempNode.rightChild)
        }
    }
    
    
    
    
    
    
    
    
    
}
