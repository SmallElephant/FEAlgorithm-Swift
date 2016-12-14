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
//    输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。如果是则输出Yes,否则输出No。假设输入的数组的任意两个数字都互不相同。
    
    func VerifySquenceOfBST(arr:[Int]) -> Bool {
        
        if(0 == arr.count) {
            return false
        }
        return isPostOrder(arr: arr, begin: 0, end: arr.count-1);
    }

    
    func isPostOrder(arr:[Int],begin:Int,end:Int) -> Bool {
        if(begin == end) {
            return true;
        }
        
        var mid:Int = begin;
        for i in 0..<end{
            mid = i
            if  arr[i] > arr[end] { //左子树的节点都小于根节点
                break
            }
        }
        
        for m in mid..<end {
            if arr[m] < arr[end] { // 右子树的节点都大于根节点
                break
            }
        }
        
        if(mid == begin || mid == end) {// 只有左子树或者只有右子树
            return isPostOrder(arr: arr, begin:begin, end:end-1)
        } else {
            return (isPostOrder(arr: arr, begin:begin, end:mid-1) && isPostOrder(arr: arr, begin:mid, end:end-1))
        }
    }

    
    static func verifyPreDataOfBST(arr:[Int]) -> Bool {
        if arr.count == 0 {
            return false
        }
        var leftIndex:Int = 0
        let root:Int = arr[0] // 首位数字是根节点
        for i in 1..<arr.count {
            leftIndex = i
            if  arr[i] > root { //左子树的节点都小于根节点
                break
            }
        }
        
        for i in leftIndex..<arr.count {
            if arr[i] < root { // 右子树的节点都大于根节点
                return false
            }
        }
        
        var isLeft = true
        var data = arr
        if leftIndex > 0 {
            isLeft = verifyPreDataOfBST(arr: Array(data[1..<leftIndex]))
        }
        
        var isRight = true
        if leftIndex < arr.count-1 {
            isRight = verifyPreDataOfBST(arr: Array(data[leftIndex..<arr.count]))
        }
        
        return isLeft && isRight
    }
    
    
}
