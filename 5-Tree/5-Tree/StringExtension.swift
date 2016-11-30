//
//  StringExtension.swift
//  5-Tree
//
//  Created by FlyElephant on 16/6/12.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

extension String {
    
    subscript(index:NSInteger)->Character {
        return self[self.startIndex.advancedBy(index)]
    }
    
    subscript(index:NSInteger)->String {
        return String(self[index] as Character)
    }
    
    subscript(range:Range<NSInteger>)->String {
        let start = startIndex.advancedBy(range.startIndex)
        let end = start.advancedBy(range.endIndex-range.startIndex)
        return self[Range(start..<end)]
    }
}