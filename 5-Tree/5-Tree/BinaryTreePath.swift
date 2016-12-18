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
        //
        if rootNode?.leftChild != nil {// 递归遍历左子树
             _ = findTreePath(rootNode: rootNode?.leftChild, targert: temp)
        }
        
        if rootNode?.rightChild != nil { // 递归遍历右子树
            _ =  findTreePath(rootNode: rootNode?.rightChild, targert: temp)
        }
        path.remove(at: path.count-1) // 回溯到父节点
        return listPath
    }
}
