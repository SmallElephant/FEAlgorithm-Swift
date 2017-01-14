//
//  Convert.swift
//  7-String
//
//  Created by FlyElephant on 17/1/14.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Convert {
    
    func stringToInt(str:String?)->Int? {
        if str == nil || str?.characters.count == 0 {
            return nil
        }
        
        var result:Int = 0
        var begin:Int = 0
        let count:Int = str!.characters.count
        var flag:Int = 1
        
        let curStr:String = str![0]
        if curStr == "+" {
            flag = 1
            begin = 1
        } else if curStr == "-" {
            flag = -1
            begin = 1
        } else if !isNumberDigit(str: curStr) {
            return nil
        }
        
        
        for i in begin..<count {
            let curStr:String = str![i]
            if  !isNumberDigit(str: curStr) {
                return nil
            }
            
            let temp:Int = Int(curStr)!
            
            if flag == 1 &&  result  > (Int.max - temp * flag) / 10 {
                return nil
            }
            
            if flag == -1 &&  result < (Int.min - temp * flag) / 10 {
                return nil
            }
            
            result = result * 10 + temp * flag
        }
        
        return result
    }
    
    func isNumberDigit(str:String)->Bool {
        return str >= "0" && str <= "9"
    }
}
