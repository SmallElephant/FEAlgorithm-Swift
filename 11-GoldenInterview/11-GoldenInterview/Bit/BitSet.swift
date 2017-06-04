//
//  BitSet.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/6/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

//给定一个数组，包含1到N的整数，N最大为32000，数组可能含有重复的值，且N的取值不定。
//    * 若只有4KB内存可用，该如何打印数组中所有重复的元素。


class BitSet {
    
    var bitSet:[Int]?
    
    init(size:Int) {
        bitSet = [Int].init(repeating: 0, count: size >> 5) // 除以32
    }
    
    func get(pos:Int) -> Bool {
        let num:Int = pos >> 5 // 除以32
        let bitNubmer:Int = pos % 32 // 除以32取余
        return (bitSet![num] & (1 << bitNubmer)) != 0
    }
    
    func set(pos:Int) {
        let num:Int = pos >> 5 // 除以32
        let bitNumber:Int = pos % 32 //除以32取余
        bitSet![num] = bitSet![num] | (1 << bitNumber)
    }
    
}
