//
//  TreeNode.swift
//  5-Tree
//
//  Created by FlyElephant on 16/6/15.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class TreeNode: NSObject {
    var data:NSString?
    var leftChild:TreeNode?
    var rightChild:TreeNode?
    
    override init() {}
    
    init(data:NSString,leftChild:TreeNode?,rightChild:TreeNode?) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}