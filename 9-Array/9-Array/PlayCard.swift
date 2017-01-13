//
//  PlayCard.swift
//  9-Array
//
//  Created by FlyElephant on 17/1/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class PlayCard {
    
    //扑克牌的顺子
    //题目：从扑克牌中随机抽5张牌，判断是不是一个顺子，即这5张牌是不是连续的。2-10为数字本身，A为1，J为11，Q为12，K为13，而大小王可以看成任意数字。
    func isContinuous(arr:[Int])->Bool {
        if arr.count == 0 {
            return false
        }
        var tempArr:[Int] = arr
        quickSort(arr: &tempArr, low: 0, high: arr.count - 1)
        
        var numOfZero:Int = 0
        
        for i in 0..<arr.count {
            if tempArr[i] > 0 {
                break
            }
            if tempArr[i] == 0 {
                numOfZero += 1
            }
        }
        
        var gap:Int = 0
        for i in 0..<tempArr.count {
            if tempArr[i] > 0 && tempArr[i-1] != 0 {
                let temp:Int = tempArr[i] - tempArr[i-1] - 1
                gap = temp > gap ? temp : gap
            }
        }
        
        var result:Bool = false
        if gap <= numOfZero {
            result = true
        }
        
        return result
    }
    
    func quickSort(arr:inout [Int],low:Int,high:Int)  {
        if low > high {
            return
        }

        let mid:Int = partition(arr: &arr, low: low, high: high)
        quickSort(arr: &arr, low: low, high: mid - 1)
        quickSort(arr: &arr, low: mid + 1, high: high)
    }
    
    
    func partition(arr:inout [Int],low:Int,high:Int) -> Int {
        let root:Int = arr[high]
        var index:Int = low
        for i in low...high {
            if arr[i] < root {
                if index != i {
                    swap(&arr[index], &arr[i])
                }
                index += 1
            }
        }
        
        if  index != high {
            swap(&arr[index], &arr[high])
        }
        
        return index
    }
}
