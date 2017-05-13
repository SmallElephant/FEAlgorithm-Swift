//
//  BinaryTree.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class BinaryTree {
    
    func treeNodeHeight(treeNode:TreeNode?) -> Int {
        if treeNode == nil {
            return 0
        }
        
        return max(treeNodeHeight(treeNode:treeNode?.leftChild), treeNodeHeight(treeNode: treeNode?.rightChild)) + 1
    }
    
    func isBalanced(root:TreeNode?) -> Bool {
        
        if root == nil {
            return true
        }
        
        let heightDiff:Int = abs(treeNodeHeight(treeNode: root?.leftChild) - treeNodeHeight(treeNode: root?.rightChild))
        
        if heightDiff > 1 {
            return false
        } else {
            return isBalanced(root:root?.leftChild) && isBalanced(root:root?.rightChild)
        }
        
    }
    
    
    func checkTreeNodeHeight(treeNode:TreeNode?) -> Int {
        if treeNode == nil {
            return 0
        }
        
        // 检查左子树是否平衡
        let leftHeight:Int = checkTreeNodeHeight(treeNode: treeNode?.leftChild)
        if leftHeight == -1 {
            return -1
        }
        
        let rightHeight:Int = checkTreeNodeHeight(treeNode: treeNode?.rightChild)
        
        if rightHeight == -1 {
            return -1
        }
        
        let heightDiff:Int = abs(leftHeight - rightHeight)
        if heightDiff > 1 {
            return -1
        } else {
            return max(leftHeight, rightHeight) + 1
        }
        
    }
    
    
    func isBalanced2(root:TreeNode?) -> Bool {
        if checkTreeNodeHeight(treeNode: root) == -1 {
            return false
        } else {
            return true
        }
    }
    
    var pathList:[[String]] = []
    var path:[String] = []
    
    func findPath(root:TreeNode?,targetNum:Int)  {
        if root == nil {
            return
        }
        
        path.append(root!.data!)
        
        let target:Int = targetNum - Int(root!.data!)!
        
        // 叶子节点，且满足要求
        if target == 0 && root?.leftChild == nil && root?.rightChild == nil {
            pathList.append(path)
        }
        
        // 遍历左子节点
        if root?.leftChild != nil {
            findPath(root: root?.leftChild, targetNum: target)
        }
        
        // 遍历右子节点
        
        if root?.rightChild != nil {
            findPath(root: root?.rightChild, targetNum: target)
        }
        
        path.removeLast()
    }
    
    
    func invertTree(rootNode:TreeNode?) {
        
        if rootNode == nil || (rootNode?.leftChild == nil && rootNode?.rightChild == nil) {
            return
        }
        
        let root:TreeNode = rootNode!
        
        swap(&root.leftChild, &root.rightChild)
        
        if root.leftChild != nil {
            invertTree(rootNode: root.leftChild)
        }
        
        if root.rightChild != nil {
            invertTree(rootNode: root.rightChild)
        }
        
    }
}
