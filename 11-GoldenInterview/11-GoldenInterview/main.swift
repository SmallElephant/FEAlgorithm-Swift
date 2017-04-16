//
//  main.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/4/15.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


var myString:MyString = MyString()

var uniqueStr:String = "FlyElephant"

var isUnique:Bool = myString.isUniqueChar(str: uniqueStr)

print("\(uniqueStr)---是不是所有字符串唯一:\(isUnique)")

var reverseTemp:String = "FlyElephant"
var reverseStr:String = myString.reverseString(str: reverseTemp)
print("反转字符串:\(reverseStr)---\(String(reverseTemp.characters.reversed()))")

var strA:String = "student"
var strB:String = "FlyElephant"
var perResult:Bool = myString.permutation(strA: strA, strB: strB)
print("\(strA)与\(strB)是不是变位词\(perResult)")


var replaceStr:String = "I am FlyElephant"
var replaceResult:String = myString.replaceSpaces(str: replaceStr)
print("字符串空格替换:\(replaceResult)")

var result2:String = myString.replaceSpaces1(str: replaceStr)
print("字符串空格替换:\(result2)")


var compressString:String = "abbcccdddd"
var compressResult:String = myString.compressBetter(str: compressString)
print("压缩结果:\(compressResult)")



