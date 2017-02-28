//
//  Statistics.swift
//  10-Number
//
//  Created by FlyElephant on 17/2/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Statistics {
    
   // 对于数abcde，c这位出现1的次数分以下情况:
   // 1.若c == 0,结轮是 ab * 100;
   // 2.若c == 1,结论是（ab）* 100 + de + 1;
   // 3.若c > 1,结论是（ab + 1）* 100;

    func sumls(num:Int) -> Int {
        var count:Int = 0
        
        for i in 1...num {
            var temp:Int = i
            while temp != 0 {
                count += temp % 10 == 1 ? 1 : 0
                temp /= 10
            }
        }

        return count
    }
    
    
    func sumlsSimple(num:Int) -> Int {
        if num <= 0 {
            return 0
        }
        var factor = 1
        var lowNum:Int = 0
        var curNum:Int = 0
        var highNum:Int = 0
        
        var count:Int = 0
        let n:Int = num
        
        while n / factor != 0 {
            lowNum = n - (n / factor) * factor
            curNum = (n / factor) % 10
            highNum = n / (factor * 10)
            
            if curNum == 0 {
                count += highNum * factor
            } else if curNum == 1 {
                count += highNum * factor + lowNum + 1
            } else {
                count += (highNum + 1) * factor
            }
            
            factor *= 10
        }
        
        return count
    }
}
