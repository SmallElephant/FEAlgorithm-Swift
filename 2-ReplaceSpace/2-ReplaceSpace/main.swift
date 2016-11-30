//
//  main.swift
//  2-ReplaceSpace
//
//  Created by keso on 16/6/10.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

var content="FlyElephant"
var index=content.startIndex.advancedBy(10)

print("\(content[index])---\(index)")

var arr=[AnyObject](count: 100, repeatedValue:NSNull())
var arrContent="My name is FlyElephant"
for index in 0...arrContent.characters.count-1 {
    var chIndex=arrContent.characters.startIndex.advancedBy(index)
    arr[index] = String(arrContent.characters[chIndex])
}
print("FlyElephant")
var replace=ReplaceSpace()
var isReplace=replace.replaceSpace(&arr, originalContent: arrContent)

print("\(arr)")



