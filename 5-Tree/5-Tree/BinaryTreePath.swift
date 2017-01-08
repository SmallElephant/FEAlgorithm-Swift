//
//  BinaryTreePath.swift
//  5-Tree
//
//  Created by keso on 2016/12/15.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class BinaryTreePath {
   // 二叉树中和为某一值的路径
   // 输入一颗二叉树和一个整数，打印出二叉树中结点值的和为输入整数的所有路径。路径定义为从树的根结点开始往下一直到叶结点所经过的结点形成一条路径。

    var path:[String] = []
    
    var listPath:[[String]] = []
    
    func findTreePath(rootNode:TreeNode?,targert:Int)->[[String]]?  {
        if rootNode == nil {
            return nil
        }
        path.append((rootNode?.data)!)
        let value:Int = Int((rootNode?.data)!)!
        var temp = targert
        temp -= value
        if temp == 0 && rootNode?.leftChild == nil && rootNode?.rightChild == nil {
            listPath.append(path) // 路径添加
        }
    
        if rootNode?.leftChild != nil {// 递归遍历左子树
             _ = findTreePath(rootNode: rootNode?.leftChild, targert: temp)
        }
        
        if rootNode?.rightChild != nil { // 递归遍历右子树
            _ =  findTreePath(rootNode: rootNode?.rightChild, targert: temp)
        }
        path.remove(at: path.count-1) // 回溯到父节点
        return listPath
    }
    
    func treeMaxDepth(rootNode:TreeNode?) -> Int {
        if rootNode == nil {
            return 0
        }
        
        let leftDepth:Int = treeMaxDepth(rootNode: rootNode?.leftChild)
        let rightDepth:Int = treeMaxDepth(rootNode: rootNode?.rightChild)
        
        return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1
    }
    
    func treeMinDepth(rootNode:TreeNode?) -> Int {
        if rootNode == nil {
            return 0
        }
        
        let leftDepth:Int = treeMinDepth(rootNode: rootNode?.leftChild)
        let rightDepth:Int = treeMinDepth(rootNode: rootNode?.rightChild)
        
        if leftDepth == 0 {
            return rightDepth + 1
        }
        
        if rightDepth == 0 {
            return leftDepth + 1
        }
        
        return leftDepth < rightDepth ? leftDepth + 1 : rightDepth + 1
    }
    
    func isBalanceTree(rootNode:TreeNode?) -> Bool {
        if rootNode == nil {
            return true
        }
        let leftDepth:Int = treeMaxDepth(rootNode: rootNode?.leftChild)
        let rightDepth:Int = treeMaxDepth(rootNode: rootNode?.rightChild)
        
        let diff:Int = leftDepth - rightDepth
        if diff > 1 || diff < -1 {
            return false
        }
        return isBalanceTree(rootNode: rootNode?.leftChild) && isBalanceTree(rootNode: rootNode?.rightChild)
    }
    
    func isBalanceTreeOnce(rootNode:TreeNode?,depth:inout Int) -> Bool {
        if rootNode == nil {
            depth = 0
            return true
        }
        var leftDepth:Int = 0
        var rightDepth:Int = 0
        if isBalanceTreeOnce(rootNode: rootNode?.leftChild, depth: &leftDepth) && isBalanceTreeOnce(rootNode: rootNode?.rightChild, depth: &rightDepth) {
            let diff:Int = leftDepth - rightDepth
            if diff <= 1 && diff >= -1 {
                depth = leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1
                return true
            }
        }
        return false
    }
    
    func isBalancedTree(rootNode:TreeNode?) -> Bool {
        var depth:Int = 0
        return isBalanceTreeOnce(rootNode: rootNode, depth: &depth)
    }
}
