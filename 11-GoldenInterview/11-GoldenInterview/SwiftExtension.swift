//
//  SwiftExtension.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/4/15.
//  Copyright © 2017年 FlyElephant. All rights reserved.
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
    
    
    func toInt()->Int {
        
        var value:Int = 0
        
        for element in self.unicodeScalars {
            value = Int(element.value)
        }
        
        return value
    }
    

    
}
