//
//  BucketSort.swift
//  6-Sort
//
//  Created by FlyElephant on 17/1/22.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class BucketSort {
    
    func sort(arr:inout [Int],min:Int,max:Int,gap:Int) {
        
        var bucketlist:[[Int]] = []
        let bucketCount:Int = (max - min) / gap + 1
        
        // 建桶
        for _ in 0..<bucketCount {
            let temp:[Int] = []
            bucketlist.append(temp)
        }
        
        // 分桶
        for i in 0..<arr.count {
            let index:Int = (arr[i] - min) / gap
            bucketlist[index].append(arr[i])
        }
        
        // 小桶排序
        for i in 0..<bucketCount {
            if bucketlist[i].count > 0 {
                buketInnerSort(arr: &bucketlist[i])
            }
        }
        
        var index:Int = 0
        for i in 0..<bucketCount {
            var bucket:[Int] = bucketlist[i]
            if bucket.count > 0 {
                for j in 0..<bucket.count {
                    arr[index] = bucket[j]
                    index += 1
                }
            }
        }
        
    }
    
    private func buketInnerSort(arr:inout [Int])  {
        let count:Int = arr.count
        for i in 1..<count {
            for j in (1...i).reversed() {
                if arr[j] < arr[j-1] {
                    swap(&arr[j], &arr[j-1])
                }
            }
        }
    }
    
}
