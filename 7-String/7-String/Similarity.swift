//
//  Similarity.swift
//  7-String
//
//  Created by keso on 2017/3/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


class Similarity {
    
    
    func calculate_distance(strA:String,beginA:Int, endA:Int,strB:String,beginB:Int,endB:Int)->Int {
        
        if beginA > endA {
            if beginB > endB {
                return 0
            } else {
                return endB - beginB + 1
            }
        }
        
        if beginB > endB {
            if beginA > endA {
                return 0
            } else {
                return endA - beginA + 1
            }
        }
        
        let beginStrA:String = strA[beginA]
        let beginStrB:String = strB[beginB]
        
        if beginStrA == beginStrB {
            return calculate_distance(strA: strA, beginA: beginA + 1, endA: endA, strB: strB, beginB: beginB + 1, endB: endB)
        } else {
            let d1:Int = calculate_distance(strA: strA, beginA: beginA, endA: endA, strB: strB, beginB: beginB + 1, endB: endB)
            
            let d2:Int = calculate_distance(strA: strA, beginA: beginA + 1, endA: endA, strB: strB, beginB: beginB, endB: endB)
            
            let d3:Int = calculate_distance(strA: strA, beginA: beginA + 1, endA: endA, strB: strB, beginB: beginB + 1, endB: endB)
            return min(a: d1, b: d2, c: d3) + 1
        }
    }
    
    
    func calculate_distance2(strA:String,strB:String)->Int {
        
        let lenA:Int = strA.characters.count
        let lenB:Int = strB.characters.count
        
        let data:[Int] = [Int].init(repeating: 0, count: lenB + 1)
        var temp:[[Int]] = [[Int]].init(repeating: data, count: lenA + 1)
        
        for i in 1...lenA {
            temp[i][0] = i
        }
        
        for j in 1...lenB {
            temp[0][j] = j
        }
        
        for i in 1...lenA {
            for j in 1...lenB {
                let tempA:String = strA[i - 1]
                let tempB:String = strB[j - 1]
                if(tempA == tempB) {
                    temp[i][j] = temp[i - 1][j - 1];
                } else {
                    temp[i][j] = min(a: temp[i - 1][j], b: temp[i][j - 1], c: temp[i - 1][j - 1]) + 1
                }
            }
        }
        
        return temp[lenA][lenB]
    }
    
    private func min(a:Int,b:Int,c:Int) -> Int {
        let temp:Int = a > b ? b : a;
        let result:Int = temp > c ? c : temp;
        return result
    }
}
