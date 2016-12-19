//
//  Permutation.swift
//  7-String
//
//  Created by keso on 2016/12/18.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation


class Permutation {
    
    var count:Int = 0
    // 去重
    func isCanSWap(arr:[String],begin:Int,end:Int) -> Bool {
        var result:Bool = true
        
        for i in begin..<end {
            if arr[i] == arr[end] {
                result = false
                break
            }
        }
        return result
    }
    
    // 字符串特定区间的字符串排列
    func full_permutation(arr:[String],begin:Int,end:Int) {
        var temp:[String] = arr
        if begin == end - 1 { // 递归之后输出
            let data:[String] = Array(arr[0..<end])
            count += 1
            print("排列---\(data)")
        } else {
            for i in begin..<end {
                let result:Bool = isCanSWap(arr: temp, begin: begin, end: i)
                if result {
                    if i != begin {
                        swap(&temp[i], &temp[begin]) // 字符串交换
                    }
                    
                    full_permutation(arr: temp, begin: begin+1, end: end)
                    
                    if i != begin {
                        swap(&temp[i], &temp[begin]) // 字符串恢复
                    }
                }
            }
        }
    }
    
    //输入一个字符串，输出该字符串中字符的所有组合。举个例子，如果输入abc，它的组合有a、b、c、ab、ac、bc、abc.
    func stringCombination(str:String) {
        let result:[String] = []
        for i in 1...str.characters.count {
            combination(str: str, m: i, result: result)
        }
    
    }
    
    func combination(str:String,m:Int,result:[String]) {
        var data = result
        if m == 0 {
            print("FlyElephant--排列---\(result)")
            return
        }
        
        if str.characters.count != 0 {
            data.append(str[0]) // 保留第一个字符
            let index = str.index(str.startIndex, offsetBy: 1)
            let nextStr:String = str.substring(from: index)
            combination(str: nextStr, m: m-1, result: data) // 第一个字符与m-1个字符之间的组合
            data.remove(at: data.count-1) // 删除最后字符
            combination(str: nextStr, m: m, result: data) // 第一个字符与m个字符之间的组合
        }
    }
}
