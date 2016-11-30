//
//  ConstructBinaryTree.swift
//  5-Tree
//
//  Created by FlyElephant on 16/6/15.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class ConstructBinaryTree: NSObject {

    func reConstructForPost(preOrder: [String],inOrder: [String]) -> TreeNode? {

        if inOrder.count == 0 {
            return nil
        }
        var pre_left:[String] = []
        var pre_right:[String] = []
        var in_left:[String] = []
        var in_right:[String] = []

        let root = TreeNode()
        root.data = preOrder[0] as NSString
        
        var rootIndex = 0
        //获取中序数组中的根节点位置
        for index in 0..<inOrder.count {
            if inOrder[index] == preOrder[0] {
                rootIndex = index
                break
            }
        }
        
        //先序左子树 中序的左子树
        for i in 0..<rootIndex {
            pre_left.append(preOrder[i+1])
            in_left.append(inOrder[i])
        }
        
        //先序的右子树 中序的右子树
        for j in rootIndex+1..<inOrder.count {
            pre_right.append(preOrder[j])
            in_right.append(inOrder[j])
        }
        
        root.leftChild=reConstructForPost(pre_left, inOrder: in_left)
        root.rightChild=reConstructForPost(pre_right, inOrder: in_right)
        
        return root
    }
    
    func reConstructForPre(inOrder: [String],postOrder: [String]) -> TreeNode? {
        
        if inOrder.count == 0 {
            return nil
        }

        var in_left:[String] = []
        var in_right:[String] = []
        var post_left:[String] = []
        var post_right:[String] = []
        
        let preRoot = TreeNode()
        preRoot.data = postOrder[postOrder.count-1] as NSString
        
        var rootIndex = 0
        //获取中序数组中的根节点位置
        for index in 0..<inOrder.count {
            if inOrder[index] == postOrder[postOrder.count-1] {
                rootIndex = index
                break
            }
        }
        
        //中序左子树 后序的左子树
        for i in 0..<rootIndex {
            in_left.append(inOrder[i])
            post_left.append(postOrder[i])
        }
        //中序的右子树 后序的右子树
        for j in rootIndex+1..<inOrder.count {
            in_right.append(inOrder[j])
            post_right.append(postOrder[j-1])
        }
        
        preRoot.leftChild=reConstructForPre(in_left, postOrder: post_left)
        preRoot.rightChild=reConstructForPre(in_right, postOrder: post_right)
        
        return preRoot
    }
}
