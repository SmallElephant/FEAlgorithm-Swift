//
//  BinarySearchTree.swift
//  5-Tree
//
//  Created by FlyElephant on 16/12/14.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class BinarySearchTree {
    
//    二叉搜索树的后序遍历序列
//    输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。如果是则输出Yes,否则输出No。假设输入的数组的任意两个数字都互不相同.
     func verifyPostDataOfBST(arr:[Int]) -> Bool {
        if arr.count == 0 {
            return false
        }
        
        if arr.count == 1 {
            return true
        }
        
        var leftIndex:Int = 0
        let root:Int = arr[arr.count-1] // 首位数字是根节点
        
        for m in 0..<arr.count-1 {
            leftIndex = m
            if  arr[m] > root {//左子树的节点都小于根节点
                break
            }
        }
        
        var rightIndex:Int = leftIndex
        for i in leftIndex..<arr.count-1 {
            rightIndex = i
            if arr[i] < root { // 右子树的节点都大于根节点
                break
            }
        }
        
        var data = arr
        let count:Int = arr.count
        
        if rightIndex == count-2 {
            // mid == right 只有左子树 mid = 0 arr[end-1] > arr[end] 只有右子树
            let isRight:Bool = (leftIndex == 0 && arr[count-2] > arr[count-1])
            if(leftIndex == rightIndex || isRight) { // 只有左子树或者只有右子树
                return verifyPostDataOfBST(arr: Array(data[leftIndex..<count-1]))
            } else if(leftIndex == 0) {
                return false
            } else {
                return verifyPostDataOfBST(arr: Array(data[0..<leftIndex])) && verifyPostDataOfBST(arr: Array(data[leftIndex..<arr.count-1]))
            }
        } else {
            return false
        }
    }
    
    
    func verifySquenceOfBST(arr:[Int]) -> Bool {
        
        if(0 == arr.count) {
            return false
        }
        return isPostOrder(arr: arr, begin: 0, end: arr.count-1);
    }

    
    func isPostOrder(arr:[Int],begin:Int,end:Int) -> Bool {
        if(begin == end) {
            return true;
        }
        
        var mid:Int = begin
        for i in 0..<end{
            mid = i
            if  arr[i] > arr[end] { //左子树的节点都小于根节点
                break
            }
        }
        var right:Int = mid
        for m in right..<end {
            right = m
            if arr[m] < arr[end] { // 右子树的节点都大于根节点
                break
            }
        }
    
        if right == end-1 {
            // mid == right 只有左子树 mid = 0 arr[end-1] > arr[end] 只有右子树
            let isRight:Bool = (mid == 0 && arr[end-1] > arr[end])
            if(mid == right || isRight) { // 只有左子树或者只有右子树
                return isPostOrder(arr: arr, begin:begin, end:end-1)
            } else if(mid == 0) {
                return false
            } else {
                return (isPostOrder(arr: arr, begin:begin, end:mid-1) && isPostOrder(arr: arr, begin:mid, end:end-1))
            }
        } else {
            return false
        }
    }

    // 是否是先序遍历集合
    func verifyPreDataOfBST(arr:[Int]) -> Bool {
        if arr.count == 0 {
            return false
        }
        
        if arr.count == 1 {
            return true
        }
        
        var leftIndex:Int = 0
        let root:Int = arr[0] // 首位数字是根节点
        let count:Int = arr.count
        for i in 1..<count {
            leftIndex = i
            if  arr[i] > root { //左子树的节点都小于根节点
                break
            }
        }
        
        var rightIndex:Int = leftIndex
        for i in leftIndex..<count {
            rightIndex = i
            if arr[i] < root { // 右子树的节点都大于根节点
                break
            }
        }
        
        var data = arr
        if rightIndex == count-1 {
            // leftIndex = rightIndex = count-1 只有左子树
            // leftIndex data[rightIndex] > data[0] 只有右子树
            if leftIndex == rightIndex || (leftIndex == 1 && data[rightIndex] > data[0]) { // 只有左子树
              return  verifyPreDataOfBST(arr: Array(data[1..<count]))
            } else if (leftIndex == 1) {
                return false
            } else {
                return verifyPreDataOfBST(arr: Array(data[1..<leftIndex])) && verifyPreDataOfBST(arr: Array(data[leftIndex..<arr.count]))
            }
        } else {
            return false
        }
    }
    
//    二叉搜索树与双向链表
//    输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的双向链表。要求不能创建任何新的结点，只能调整树中结点指针的指向.
    
    var leftHead:TreeNode?
    var rightHead:TreeNode?
    func convertTwoWayList(rootNode:TreeNode?) -> TreeNode? {
        convertSubList(rootNode: rootNode)
        return leftHead
    }
    
    func convertSubList(rootNode:TreeNode?) {
        if rootNode == nil {
            return
        }
        convertSubList(rootNode: rootNode?.leftChild)
        
        if rightHead == nil {
            leftHead = rootNode
            rightHead = rootNode
        } else {
            // 右节点和根节点双向指针  注意更新右节点
            rightHead?.rightChild = rootNode
            rootNode?.leftChild = rightHead
            rightHead = rootNode
        }
        
        convertSubList(rootNode: rootNode?.rightChild)
    }
}
