//
//  main.swift
//  3-Fibonacci
//
//  Created by keso on 16/6/11.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation


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




var dimensionData = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
//var dimensionData = [[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18],[19,20,21,22,23,24]]
//dimensionData = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]
dimensionData = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
var rows = dimensionData.count
var cols = dimensionData[0].count

printMatrixClockwisly(data: dimensionData, rows: rows, cols: cols)
print()
//var test = dimensionData[3][2]
//print("\(test)")







