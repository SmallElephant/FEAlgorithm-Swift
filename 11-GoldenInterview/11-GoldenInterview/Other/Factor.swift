//
//  Factor.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/5/29.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Factor {
    
    func getKthFactorNumber(k:Int) -> Int {
        
        if k < 0 {
            return 0
        }
        
        var val:Int = 1
        var arr:[Int] = []
        addProducts(arr: &arr, num: 1)
        
        for _ in 0..<k {
            val = removeMin(arr: &arr)
            addProducts(arr: &arr, num: val)
        }
        return val
        
    }
    
    func removeMin(arr:inout [Int]) -> Int {
        if arr.count == 0 {
            return 1
        }
        var min:Int = arr.first!
        for num in arr {
            if min > num {
                min = num
            }
        }
        
        while arr.contains(min) {
           
            for i in 0..<arr.count {
                if arr[i] == min {
                    arr.remove(at: i)
                    break
                }
            }
        }
        return min
    }
    
    func addProducts(arr:inout [Int],num:Int) {
        arr.append(3 * num)
        arr.append(5 * num)
        arr.append(7 * num)
    }
    
    func getKthFactorNumber2(k:Int) -> Int {
        
        if k < 0 {
            return 0
        }
        
        var val:Int = 0
        var arr3:[Int] = [1]
        var arr5:[Int] = []
        var arr7:[Int] = []
        
        for _ in 0...k {
            
            let num3:Int = arr3.count > 0 ? arr3.first! : Int.max
            let num5:Int = arr5.count > 0 ? arr5.first! : Int.max
            let num7:Int = arr7.count > 0 ? arr7.first! : Int.max
            
            val = min(num3, min(num5, num7))
            
            if num3 == val {
                arr3.removeFirst()
                arr3.append(val * 3)
                arr5.append(val * 5)
            } else if num5 == val {
                arr5.removeFirst()
                arr5.append(val * 5)
            } else if num7 == val {
                arr7.removeFirst()
            }
            arr7.append(val * 7)
        }
        
        return val
    }
    
    func getKthFactorNumber3(k:Int) -> Int {
        
        if k < 0 {
            return 0
        }
        
        var index3:Int = 0
        var index5:Int = 0
        var index7:Int = 0
        var arr:[Int] = [1]
        var val:Int = 0
        
        for _ in 0...k {
            
            val = min(arr[index3] * 3, min(arr[index5] * 5, arr[index7] * 7))
            
            if arr[index3] * 3 == val {
                index3 += 1
            }
            
            if arr[index5] * 5 == val {
                index5 += 1
            }
            
            if arr[index7] * 7 == val {
                index7 += 1
            }
            
            arr.append(val)
        }
        
        return arr[arr.count - 2]
    }
    
}
