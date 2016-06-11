//
//  SearchDimension.swift
//  1-SearchForDimension
//
//  Created by keso on 16/6/10.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class SearchDimension: NSObject {

    func searchNumber(data:Array<AnyObject>,number:NSInteger)->Bool{
        if data.count>0 && data[0].count>0 {
            var row=0
            let rows=data[0].count
            let columns=data.count
            var column=columns-1
            while row<rows && column>=0 {
                let rightValue=data[row][column] as! NSInteger
                //存在
                if  rightValue==number {
                    print("current row:\(row)--current column:\(column)")
                    return true
                } else if rightValue>number {//数值小于右上角的值，排除一列
                    column=column-1
                } else {//数值大于右上角的值，排除一列
                    row=row+1
                }
            }
        }
        return false;
    }

}
