//
//  ListNodeManager.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/4/22.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class ListNodeManger {
    
    var headNode:ListNode?
    
    // 1. 创建链表
    
    func appendToTail(value:String) {
        
        let node:ListNode = ListNode(value: value)
    
        if headNode == nil {
            headNode = node
        } else {
            var nextNode:ListNode? = headNode
            while nextNode?.next != nil {
                nextNode = nextNode?.next
            }
            nextNode?.next = node
        }
    }
    
    func printListNode(headNode:ListNode)  {
        
        var node:ListNode? = headNode
        while node != nil {
            print("\(node!.value!)")
            node = node?.next
        }
    }
    
    // 1. 移除未排序链表中的重复结点
    
    func deleteDuplitation(node:ListNode)  {
        
        var map:[String:Bool] = [ : ]
        
        var head:ListNode? = node
        var preNode:ListNode? = node
        
        while head != nil {
            let value:String = (head?.value!)!
            if map.keys.contains(value) {
                preNode?.next = head?.next
            } else {
                preNode = head
                map[value] = true
            }
            head = head?.next
        }
    }
    
    // 1.2 倒数第k个节点
    func nthToLastNode(node:ListNode,k:Int) -> ListNode? {
        if k <= 0 {
            return nil
        }
        
        var p1:ListNode? = node
        var p2:ListNode? = node
        
        for _ in 0..<k - 1 {
            if p2 == nil {
                return nil
            }
            p2 = p2?.next
        }
        
        if p2 == nil {
            return nil
        }
        
        while p2?.next != nil {
            p1 = p1?.next
            p2 = p2?.next
        }
        
        return p1
    }
    
}
