//
//  MyString.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/4/15.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class MyString {
    
    // 1.1 字符串中的字符是否完全相同
    
    func isUniqueChar(str:String)->Bool {
        
        if str.characters.count > 256 {
            return false
        }
        
        var chars:[Bool] = [Bool].init(repeating: false, count: 256)
        
        for i in 0..<str.characters.count {
            
            let temp:String = str[i] as String
            
            let index:Int = temp.toInt()
            
            if chars[index] {
                return false
            }
            
            chars[index] = true
        }
        
        return true
    }
    
    // 1.2 字符串反转
    
    func reverseString(str:String) -> String {
        
        var arr = Array(str.characters)

        let count:Int = arr.count
        
        for i in 0..<count / 2 {
            swap(&arr[i], &arr[count - i - 1])
        }
        
        return String(arr)
    }
    
    // 1.3 是否是变位词
    
    func permutation(strA:String,strB:String) -> Bool {
        
        if strA.characters.count != strB.characters.count {
            return false
        }
        
        var arr:[Int] = [Int].init(repeating: 0, count: 256)
        
        for i in 0..<strA.characters.count {
            
            let temp:String = strA[i] as String
            
            let index:Int = temp.toInt()
            
            arr[index] = arr[index] + 1
        }
        
        for i in 0..<strB.characters.count {
            let temp:String = strA[i] as String
            
            let index:Int = temp.toInt()
            
            if arr[index] - 1 < 0 {
                return false
            }
        }
        
        return true
    }
    
    // 1.4 空格替换
    
    func replaceSpaces(str:String) -> String  {
        
        var result:String = ""
        
        for i in 0..<str.characters.count {
            if str[i] == " " {
                result.append("%20")
            } else {
                result.append(str[i] as Character)
            }
        }
        
        return result
    }
    
    
    func replaceSpaces1(str:String) -> String {
        
        var spaceCount:Int = 0
        
        let count:Int = str.characters.count
        
        for i in 0..<count {
            if (str[i] as Character) == " " {
                spaceCount += 1
            }
        }
        
        let charCount:Int = count + spaceCount * 2
        var chars:[Character] = [Character].init(repeating: " ", count: charCount)
        
        var index:Int = charCount - 1
        
        for i in stride(from: count - 1, to: -1, by: -1) {
            if (str[i] as Character) == " " {
                chars[index] = "0"
                chars[index - 1] = "2"
                chars[index-2] = "%"
                index -= 3
            } else {
                chars[index] = str[i] as Character
                index -= 1
            }
        }
        
        return String(chars)
    }
    
    
    // 1.5 字符串压缩
    func compressBetter(str:String) -> String {
        
        let count:Int = str.characters.count
        
        if count == 0 {
            return ""
        }
        
        var result:String = ""
        
        var last:Character = str[0] as Character
        var charCount:Int = 0
        
        for i in 0..<count {
            
            let temp:Character = str[i] as Character
            
            if temp == last {
                charCount += 1
            } else {
                result.append(last)
                result.append("\(charCount)")
                last = temp
                charCount = 1
            }
        }
        
        result.append(last)
        result.append("\(charCount)")
        
        if result.characters.count >= count {
            return str
        }
        
        return result
    }

    
    
}
