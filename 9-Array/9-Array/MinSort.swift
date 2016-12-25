//
//  MinSort.swift
//  9-Array
//
//  Created by keso on 2016/12/25.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class MinSort {
//    把数组排成最小的数
//    题目:输入一个正整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。例如输入数组{3，32，321}，则打印出这三个数字能排成的最小数字为321323.
    
    func printMinNumber(data:[Int])  {
        if data.count == 0 {
            return
        }
        
        var arr:[String] = []
        
        for i in 0..<data.count {
            arr.append("\(data[i])")
        }
        
        arr = arr.sorted { (a, b) -> Bool in
            let tempA:String = a + b
            let tempB:String = b + a
            return tempA < tempB
        }
        
        let result:String = arr.joined(separator: "")
        print("FlyElephant--最小的数--\(result)")
    }
    
    //丑数
    //把只包含因子2、3和5的数称作丑数（Ugly Number）。例如6、8都是丑数，但14不是，因为它包含因子7。
//    习惯上我们把1当做是第一个丑数。求按从小到大的顺序的第N个丑数.
    
    func findUglyNumber(index:Int) -> Int {
        
        var indexMulti2:Int = 0
        var indexMulti3:Int = 0
        var indexMulti5:Int = 0
        var uglyNumbers:[Int] = [1]
        var count:Int = 1
        while count < index {
            let numberMulti2:Int = uglyNumbers[indexMulti2]*2
            let numberMulti3:Int = uglyNumbers[indexMulti3]*3
            let numberMulti5:Int = uglyNumbers[indexMulti5]*5
            let min:Int = findMinNumber(a: numberMulti2, b: numberMulti3, c: numberMulti5)
            if min == numberMulti2 {
                indexMulti2 += 1
            }
            
            if min == numberMulti3 {
                indexMulti3 += 1
            }
            
            if min == numberMulti5 {
                indexMulti5 += 1
            }
            uglyNumbers.append(min)
            count += 1
        }
        return uglyNumbers[count-1]
    }
    
    func findMinNumber(a:Int,b:Int,c:Int) -> Int {
        let result = a > b ? b : a
        return result > c ? c : result
    }
    
    
}
