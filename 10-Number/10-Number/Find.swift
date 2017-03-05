//
//  Find.swift
//  10-Number
//
//  Created by keso on 2017/3/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Find {
    
    func minMax(arr:[Int])->(Int,Int) {
        
        var min:Int = arr[0]
        var max:Int = arr[0]
        
        for i in 0..<arr.count {
            if arr[i] < min {
                min = arr[i]
            }
            
            if arr[i] > max {
                max = arr[i]
            }
        }
        
        return (min,max)
    }
    
    
    func minMax1(arr:[Int]) -> (Int,Int) {
        
        var data:[Int] = arr
        var min:Int = data[0]
        var max:Int = data[0]
        
        for i in stride(from: 0, to: data.count - 1, by: 2) {
            if data[i] < data[i + 1]{
                swap(&data[i], &data[i+1])
            }
        }
        
        
        for i in stride(from: 0, to: data.count - 1, by: 2) {
            if  data[i] > max {
                max = data[i]
            }
            
            if data[i+1] < min {
                min = data[i+1]
            }

        }
        
        if data[data.count-1] > max {
            max = data[data.count - 1]
        }
        
        if data[data.count-1] < min {
            min = data[data.count - 1]
        }
        
        return (min,max)
        
    }
    
    func minMax2(arr:[Int]) -> (Int,Int) {
        
        var data:[Int] = arr
        var min:Int = data[0]
        var max:Int = data[0]
        
        for i in stride(from: 0, to: data.count - 1, by: 2) {
            let tempMax:Int = data[i] > data[i+1] ? data[i] : data[i+1]
            let tempMin:Int = data[i] < data[i+1] ? data[i] : data[i+1]
            if  tempMax > max {
                max = tempMax
            }
            
            if tempMin < min {
                min = tempMin
            }

        }
        
        if data[data.count-1] > max {
            max = data[data.count - 1]
        }
        
        if data[data.count-1] < min {
            min = data[data.count - 1]
        }
        
        return (min,max)
        
    }
    
}
