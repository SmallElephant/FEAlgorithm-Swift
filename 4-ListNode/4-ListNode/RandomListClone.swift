//
//  RandomListClone.swift
//  4-ListNode
//
//  Created by FlyElephant on 16/12/17.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class RandomListClone {
    
    // 复杂链表的复制
   // 输入一个复杂链表（每个节点中有节点值，以及两个指针，一个指向下一个节点，另一个特殊指针指向任意一个节点).
    func randomListNodeClone(headNode:inout RandomListNode?) {
        var pHead:RandomListNode? = headNode
        // A->B->C 拷贝 A->A1->B->B2->C->C1
        while pHead != nil {
            let cloneNode:RandomListNode = RandomListNode()
            cloneNode.data = (pHead?.data)! + "1"
            cloneNode.next = pHead?.next
            pHead?.next = cloneNode
            
            pHead = cloneNode.next
        }
        // sibling 拷贝
        var sHead:RandomListNode? = headNode
        while sHead != nil {
            let nextNode:RandomListNode? = sHead?.next
            if nextNode != nil {
                nextNode!.sibling = sHead?.sibling?.next
            }
            sHead = sHead?.next?.next
        }
        
        // 拆分链表
        let cloneHead:RandomListNode? = headNode?.next
        headNode = cloneHead
        var beginNode:RandomListNode? = cloneHead
        while beginNode != nil {
            let temp = beginNode?.next?.next
            if beginNode?.next != nil {
                beginNode?.next = temp
            }
            beginNode = temp
        }
    }
    
}
