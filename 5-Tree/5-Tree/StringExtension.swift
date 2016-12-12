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
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
    
    subscript(index:NSInteger)->String {
        return String(self[index] as Character)
    }
    
    subscript(range:Range<NSInteger>)->String {
        let start = characters.index(startIndex, offsetBy: range.lowerBound)
        let end = characters.index(start, offsetBy: range.upperBound-range.lowerBound)
        return self[Range(start..<end)]
    }
}
