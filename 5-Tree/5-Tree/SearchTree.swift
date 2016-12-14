//
//  SearchTree.swift
//  5-Tree
//
//  Created by keso on 2016/12/11.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class SearchTree {
    // 输入两颗二叉树A和B，判断B是不是A的子结构。
    
    func hasSubTree(root:TreeNode?,subRoot:TreeNode?) -> Bool {
        var result:Bool = false
        if root != nil && subRoot != nil {
            if root!.data! == subRoot!.data! {
                result = isExistSubTree(root: root, subRoot: subRoot)
            }
            
            if !result {
               result = hasSubTree(root: root?.leftChild, subRoot: subRoot)
            }
            
            if !result {
                result = hasSubTree(root: root?.rightChild, subRoot: subRoot)
            }
        }
        
        return result
    }
    
    func isExistSubTree(root:TreeNode?,subRoot:TreeNode?) -> Bool {
        if subRoot == nil {
            return true
        }
        
        if root == nil {
            return false
        }
        
        if root!.data! != subRoot!.data! {
            return false
        }
        
        return isExistSubTree(root: root?.leftChild, subRoot: subRoot?.leftChild) && isExistSubTree(root: root?.rightChild, subRoot: subRoot?.rightChild)
    }
}
