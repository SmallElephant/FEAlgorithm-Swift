//
//  main.swift
//  7-String
//
//  Created by keso on 2016/12/18.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

print("Hello, World!")


var arr:[String] = ["a","b","c"]

var permutation:Permutation = Permutation()
permutation.full_permutation(arr: arr, begin: 0, end: arr.count)
print("FlyElephant--\(permutation.count)")

var str:String = "abc"
permutation.stringCombination(str: str)


var hashSearch:HashSearch = HashSearch()
var firstChar:String = hashSearch.findFirstStr(string: "简简单单的FlyElephant")
print("第一次只出现一次的字符---\(firstChar)")

var result:String = hashSearch.compareDelete(origin: "We are students.", delte: "aeiou")
print("FlyElephatn-对比删除之后的字符串---\(result)")

var simple:String = hashSearch.deleteDuplicationChar(origin: "FlyElephant")
print("FlyElephant-去除重复之后的字符串---\(simple)")

var isAnagram:Bool = hashSearch.isAnagram(first: "abca", next: "baccccc")
print("FlyElephant-是否是变位词---\(isAnagram)")

var orginalStr:String = "I am  FlyElephant"
var reverseString:ReverseString = ReverseString()
var reverseResult:String = reverseString.reverseSentence(str: orginalStr)
print("反转之后的字符串---\(reverseResult)---")

var roateResult:String = reverseString.leftRoateString(str: "abcdefg", len: 2)
print("左旋转之后的字符串---\(roateResult)")
