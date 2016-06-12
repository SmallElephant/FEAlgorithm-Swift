//
//  main.swift
//  4-ListNode
//
//  Created by FlyElephant on 16/6/12.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation





func reverseListNode(node:ListNode?) -> Void {
    if (node != nil) {
        if ((node?.next) != nil) {
            reverseListNode(node?.next!)
        }
        
        if let nodeValue = node?.value! {
            print("\(nodeValue)")
        }
    }
}

var node1=ListNode()
node1.value=10

var node2=ListNode()
node2.value=20
node1.next=node2

var node3=ListNode()
node3.value=30
node2.next=node3

var node4 = ListNode()
node4.value=40
node3.next=node4

var node5 = ListNode()
node5.value=50
node4.next=node5

reverseListNode(node1)

        