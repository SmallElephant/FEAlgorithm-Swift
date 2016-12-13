//
//  Dimension.swift
//  3-Fibonacci
//
//  Created by FlyElephant on 16/12/12.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

// 顺时针打印矩阵

class Dimension {
    
    func printMatrixClockwisly(data:[[Int]]?,rows:Int,cols:Int) {
        if data == nil || rows <= 0  {
            return;
        }
        
        var start:Int = 0
        while start <= rows/2 && start <= cols/2 {
            printMatrixInCircle(data:data!,rows:rows,cols:cols,start:start)
            start += 1
        }
    }
    
    func printMatrixInCircle(data:[[Int]],rows:Int,cols:Int,start:Int) {
        let endX:Int = cols - 1 - start  //最大列
        let endY:Int = rows - 1 - start // 最大行
        
        // 从左到右打印行
        for i in start...endX {
            let value:Int = data[start][i]
            print("\(value)", terminator: " ")
        }
        
        if start < endY {
            // 从上到下打印列
            for i in start+1...endY {
                let value:Int = data[i][endX]
                print("\(value)", terminator: " ")
            }
        }
        
        if start < endX && start+1 < endY {
            // 从右向左打印行
            for i in (start..<endX).reversed() {
                let value:Int = data[endY][i]
                print("\(value)", terminator: " ")
            }
        }
        
        if start < endX && start+1 < endY {
            // 从下到上打印行
            for i in (start+1..<endY).reversed() {
                let value:Int = data[i][start]
                print("\(value)", terminator: " ")
            }
        }
        
    }

}
