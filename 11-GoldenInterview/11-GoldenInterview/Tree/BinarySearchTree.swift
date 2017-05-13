//
//  BinarySearchTree.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class BinarySearchTree {
    
    
    
    // 创建二叉查找树
    
    func createMinBST(arr:[Int],start:Int,end:Int) -> TreeNode? {
        
        if arr.count == 0 {
            return nil
        }
        
        if start < 0 || end < 0 {
            return nil
        }
        
        if start > end {
            return nil
        }
        
        let mid:Int = (start + end) / 2
        
        let treeNode:TreeNode = TreeNode()
        treeNode.data = "\(arr[mid])"
        treeNode.leftChild = createMinBST(arr: arr, start: start, end: mid - 1)
        treeNode.rightChild = createMinBST(arr: arr, start: mid + 1, end: end)
        
        return treeNode
    }
    
    // 某一深度的链表创建
    
    func createLevelList(node:TreeNode?) -> [[String]]? {
        if node == nil {
            return nil
        }
        
        var lists:[[String]] = []
        createLevelLinkedList(root: node, lists: &lists, level: 0)
        return lists
    }
    
    func createLevelLinkedList(root:TreeNode?,lists:inout [[String]],level:Int) {
        if root == nil {
            return
        }
        
        if lists.count == level { // 当前level没有数据
            let levelData:[String] = [root!.data!]
            lists.append(levelData)
        } else {
             lists[level].append(root!.data!)
        }
        
        createLevelLinkedList(root: root?.leftChild, lists: &lists, level: level + 1)
        createLevelLinkedList(root: root?.rightChild, lists: &lists, level: level + 1)
    }
    
    
    // 判断二叉树是否为二叉查找树
    
    func copyBST(root:TreeNode?,data:inout [String]) {
        if root == nil {
            return
        }
        
        copyBST(root: root?.leftChild, data: &data)
        data.append(root!.data!)
        copyBST(root: root?.rightChild, data: &data)
    }
    
    
    func isBST(root:TreeNode?) -> Bool {
        if root == nil {
            return false
        }
        
        var data:[String] = []
        
        copyBST(root: root, data: &data)
        
        print("中序遍历结果---\(data)")
        for i in 0..<data.count - 1 {
            
            if Int(data[i])! > Int(data[i + 1])!  {
                return false
            }
            
        }
        
        return true
    }
    
    
    var lastNum:Int = Int.min
    
    func isBST2(root:TreeNode?) -> Bool {
        if  root == nil {
            return true
        }
        
        // 检查左子树
        if !isBST2(root: root?.leftChild) {
            return false
        }
        
        if Int(root!.data!)! <= lastNum {
            return false
        }
        
        // 检查右子树
        if !isBST2(root: root?.rightChild) {
            return false
        }
        
        return true
    }
    
    func isBST3(root:TreeNode?) -> Bool {
        return checkBST3(node: root, min: Int.min, max: Int.max)
    }
    
    func checkBST3(node:TreeNode?,min:Int,max:Int) -> Bool {
        if  node == nil {
            return true
        }
        
        let value:Int = Int(node!.data!)!
        
        if value < min || value >= max {
            return false
        }
        
        if !checkBST3(node: node?.leftChild, min: min, max: value) || !checkBST3(node: node?.rightChild, min: value, max: max){
            return false
        }
        
        return true
    }

    
}
