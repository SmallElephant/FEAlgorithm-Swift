//
//  ViewController.swift
//  6-Sort
//
//  Created by keso on 2016/11/27.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let data:[Int] = [1,2,3,2,4,8,9,10,19,0]
        let result = quickSort(data: data)
        print("FlyElephant方案1:-\(result)")
        
        var arr:[Int] = [10,3,17,8,5,2,1,9,5,4]
        quickSort(data: &arr, low: 0, high: arr.count-1)
        print("FlyElephant方案2:-\(arr)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func quickSort(data:[Int])->[Int]{
        if data.count<=1 {
            return data
        }
        
        var left:[Int] = []
        var right:[Int] = []
        let pivot:Int = data[data.count-1]
        for index in 0..<data.count-1 {
            if data[index] < pivot {
                left.append(data[index])
            }else{
                right.append(data[index])
            }
        }
        
        var result = quickSort(data: left)
        result.append(pivot)
        let rightResult = quickSort(data: right)
        result.append(contentsOf: rightResult)
        return result
    }
    
    func partition( data:inout [Int],low:Int,high:Int) -> Int {
        
        let root = data[high]
        var index = low
        for i in low...high {
            if data[i] < root {
                if i != index {
                    swap(&data[i], &data[index])
                }
                index = index+1
            }
        }
        
        if high != index {
            swap(&data[high], &data[index])
        }
        return index
    }
    
    func quickSort(data:inout [Int],low:Int,high:Int) -> Void {
        if low > high {
            return
        }
        let sortIndex = partition(data: &data, low: low, high: high)
        quickSort(data: &data, low: low, high: sortIndex-1)
        quickSort(data: &data, low: sortIndex+1, high: high)
    }


}

