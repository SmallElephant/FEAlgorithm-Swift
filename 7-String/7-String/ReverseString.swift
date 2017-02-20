//
//  ReverseString.swift
//  7-String
//
//  Created by keso on 2017/1/8.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class ReverseString {
    

    func reversePosition(strArr:inout [Character],begin:Int,end:Int)  {
        var low:Int = begin
        var high:Int = end
        while low < high {
            swap(&strArr[low], &strArr[high])
            low += 1
            high -= 1
        }
    }
    
    func leftRoateString(str:String,len:Int) -> String {
        var strArr:[Character] = [Character]()
        for c in str.characters {
            strArr.append(c)
        }
        reversePosition(strArr: &strArr, begin: 0, end: len - 1)
        reversePosition(strArr: &strArr, begin: len, end: strArr.count - 1)
        reversePosition(strArr: &strArr, begin: 0, end: strArr.count - 1)
        return String(strArr)
    }
    
    func reverseSentence(str:String) -> String {
        var strArr:[Character] = [Character]()
        for c in str.characters {
            strArr.append(c)
        }
        reversePosition(strArr: &strArr, begin: 0, end: str.characters.count - 1)
        
        var start:Int = 0
        var end:Int = 0
        
        
        while end < strArr.count {
            if String(strArr[start]) == " " {
                start += 1
                end += 1
            } else if String(strArr[end]) == " " {
                 reversePosition(strArr: &strArr, begin: start, end: end-1)
                 start = end
            } else {
                end += 1
            }
        }
        
        return String(strArr)
    }
    
    

}
