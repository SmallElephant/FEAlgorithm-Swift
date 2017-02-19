//
//  ReplaceSpace.swift
//  2-ReplaceSpace
//
//  Created by keso on 16/6/10.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class ReplaceSpace: NSObject {
    
    func replaceSpace(_ data: inout Array<AnyObject>,originalContent:String)->Bool{
        if data.count==0 {
            return false
        }
        var spaceCount=0
        for content in data {
            if content as? String == " " {
                spaceCount=spaceCount+1
            }
        }
        let newLength=originalContent.characters.count+spaceCount*2
        
        var endIndex=newLength-1
        var moveIndex=originalContent.characters.count-1
        
        while moveIndex>=0 && endIndex>moveIndex {
            //遇到空格替换
            if data[moveIndex] as? String==" " {
                data[endIndex--]="0" as AnyObject
                data[endIndex--]="2" as AnyObject
                data[endIndex--]="%" as AnyObject
            }else{
                //非空格moveIndex从后向前移动
                data[endIndex--]=data[moveIndex]
            }
            moveIndex -= 1
        }
        
        return true
    }

}
