//
//  HashSearch.swift
//  7-String
//
//  Created by FlyElephant on 16/12/26.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class HashSearch {
    
    //第一个只出现一次的字符
    //题目：在一个字符串中找到第一个只出现一次的字符。如输入abaccdeff，则输出b.
    
    func findFirstStr(string:String) -> String {
        var str:String = string
        var dict:[String:Int] = [:]
        for i in 0..<str.characters.count {
            let char:String = str[i]
            if dict[char] != nil {
                let count:Int = dict[char]!
                dict[char] = count + 1
            } else {
                dict[char] = 1
            }
        }
        var result:String = ""
        for i in 0..<str.characters.count {
            let char:String = str[i]
            if dict[char]! == 1 {
                result = char
                break
            }
        }
        return result
    }
    
//    从第一个字符串中删除第二个字符串中出现的所有字符
    //定义一个函数，输入两个字符串，从第一个字符串中删除在第二个中出现过的所偶字符串。例如从第一个字符串"We are students."中删除第二个字符中“aeiou”中出现过的字符得到的结果是"W r stdnts"
    func compareDelete(origin:String,delte:String) -> String {
        if origin.characters.count == 0 {
            return ""
        }
       
        var dict:[String:Int] = [:]
        for i in 0..<delte.characters.count {
            let char:String = delte[i]
            if dict[char] == nil {
                dict[char] = 1
            }
        }
        var result:String = ""
        for i in 0..<origin.characters.count  {
            let char:String = origin[i]
            if dict[char] == nil {
                result += char
            }
        }
        
        return result
    }
    
    //字符串去重
    
    func deleteDuplicationChar(origin:String) -> String {
        var dict:[String:Int] = [:]
        var result:String = ""
        for i in 0..<origin.characters.count {
            let char:String = origin[i]
            if dict[char] == nil {
                result += char
                dict[char] = 1
            }             
        }
        return result
    }
    
    //变位词
    //如果两个单词的组成字母完全相同，只是字母的排列顺序不一样，则它们就是变位词，两个单词相同也被认为是变位词。如tea 与eat , nic 与cin, ddc与dcd, abc与abc.
    
    func isAnagram(first:String,next:String) -> Bool {
        if first == next {
            return true
        }
        
        var dict:[String:Int] = [:]
        for i in 0..<first.characters.count {
            let char:String = first[i]
            if dict[char] != nil {
                let count:Int = dict[char]!
                dict[char] = count + 1
            } else {
               dict[char] = 1
            }
        }
        
        for i in 0..<next.characters.count {
            let char:String = next[i]
            if dict[char] != nil {
                let count:Int = dict[char]!
                dict[char] = count - 1
            }
        }
        
        var result:Bool = true
        for (_,value) in dict {
            if value != 0 {
                result = false
            }
        }
        return result
    }
    
}

