//
//  HeapSort.swift
//  6-Sort
//
//  Created by keso on 2016/12/22.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class HeapSort {
    
    
    func heapSort(arr:inout [Int]) {
        
        buildMinHeap(arr: &arr) //建立堆，无序
        
        for i in (1..<arr.count).reversed() {
            swap(&arr[i], &arr[0]) // 第一个元素和第i个元素交换
            minHeap(arr: &arr, count: i, index: 0) // 第一个元素不断的调整位置
        }
        
    }
    
    
    func buildMinHeap(arr:inout [Int]) {
        
        let count:Int = arr.count
        let index:Int = count/2 - 1
        for i in (0...index).reversed() {
            minHeap(arr: &arr, count: count-1, index: i)
        }
    }
    
    func minHeap(arr:inout [Int],count:Int,index:Int) {
        var parent:Int = index
        var child:Int = 2*parent + 1 // 获取左子树节点
        while  child < count {
            let right:Int = child + 1
            // 如果右节点大于左节点，则选择右孩子节点
            if right < count && arr[child] < arr[right] {
                child += 1
            }
            
            // 如果父节点大于左右节点中的大值返回
            if arr[parent] > arr[child] {
                break;
            }
            
            if index != child {
                swap(&arr[parent], &arr[child]) // 父节点下沉
            }
            parent = child // 选择孩子节点作为根节点
            child = child + 1
        }
        
    }
    
    func heapMaxSort(arr:inout [Int]) {
        
        buildMaxHeap(arr: &arr) //建立最大堆，无序
        
        for i in (1..<arr.count).reversed() {
            swap(&arr[i], &arr[0]) // 第一个元素和第i个元素交换
            maxHeap(arr: &arr, count: i, index: 0) // 第一个元素不断的调整位置
        }
        
    }
    
    
    func buildMaxHeap(arr:inout [Int]) {
        
        let count:Int = arr.count
        let index:Int = count/2 - 1
        for i in (0...index).reversed() {
            maxHeap(arr: &arr, count: count-1, index: i)
        }
    }
    
    func maxHeap(arr:inout [Int],count:Int,index:Int) {
        var parent:Int = index
        var child:Int = 2*parent + 1 // 获取左子树节点
        while  child < count {
            let right:Int = child + 1
            // 如果右节点小于左节点，则选择右孩子节点
            if right < count && arr[child] > arr[right] {
                child += 1
            }
            
            // 如果父节点小于左右节点中的大值返回
            if arr[parent] < arr[child] {
                break;
            }
            
            if index != child {
                swap(&arr[parent], &arr[child]) // 父节点下沉
            }
            parent = child // 选择孩子节点作为根节点
            child = child + 1
        }
        
    }
    

    
}
