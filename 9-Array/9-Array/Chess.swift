//
//  Chess.swift
//  9-Array
//
//  Created by keso on 2017/2/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Chess {
    
    func printResult()  {
        for i in 1...9 {
            for j in 1...9 {
                if i % 3 != j % 3 {
                    print("A---\(i)---------B----\(j)")
                }
            }
        }
    }
    
}
