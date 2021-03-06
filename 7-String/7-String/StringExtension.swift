//
//  StringExtension.swift
//  7-String
//
//  Created by keso on 2016/12/18.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

extension String {
    
    subscript(index:Int)->Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
    
    subscript(index:Int)->String {
        return String(self[index] as Character)
    }
    
    subscript(range:Range<Int>)->String {
        let start = characters.index(startIndex, offsetBy: range.lowerBound)
        let end = characters.index(start, offsetBy: range.upperBound-range.lowerBound)
        return self[Range(start..<end)]
    }
}
