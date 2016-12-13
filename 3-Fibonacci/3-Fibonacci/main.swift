//
//  main.swift
//  3-Fibonacci
//
//  Created by keso on 16/6/11.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation




var dimensionData = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
//var dimensionData = [[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18],[19,20,21,22,23,24]]
//dimensionData = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]
dimensionData = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
var rows = dimensionData.count
var cols = dimensionData[0].count
var dimension:Dimension = Dimension();
dimension.printMatrixClockwisly(data: dimensionData, rows: rows, cols: cols)
print("FlyElephant")
//var test = dimensionData[3][2]
//print("\(test)")







