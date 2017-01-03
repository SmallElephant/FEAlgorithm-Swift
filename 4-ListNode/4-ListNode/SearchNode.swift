//
//  SearchNode.swift
//  4-ListNode
//
//  Created by keso on 2016/12/10.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class SearchNode {
    
    // 输出链表
    func printList(_ head:ListNode?) {
        var node:ListNode? = head
        while node != nil {
            print("\(node!.value!)")
            node = node?.next
        }
    }
    
    func createList(_ head:inout ListNode?,data:Int) {
        let node:ListNode = ListNode()
        node.value = data
        if head == nil {
            node.next = nil
        } else {
            head?.next = node
        }
        head = node
    }
    
//    题目：输入一个链表，输出该链表中倒数第k个结点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾结点是倒数第1个结点。例如一个链表有6个结点，从头结点开始它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个结点是值为4的结点。
    
    func findNodeByDescendIndex(head:ListNode?,index:Int) -> ListNode? {
        if head == nil || index < 1 {
            return nil
        }
        var preNode:ListNode? = head
        var firstNode:ListNode? = head
        
        for _ in 0..<index-1 {
            if preNode == nil {
                break
            }
            preNode = preNode?.next
        }
        
        while preNode?.next != nil {
            preNode = preNode?.next
            firstNode = firstNode?.next
        }
        return firstNode
    }
    
    
    // 链表的中点
    func findCenterNode(head:ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        
        var startNode:ListNode? = head
        var nextNode:ListNode? = head?.next
        while nextNode != nil {
            startNode = startNode?.next
            nextNode = nextNode?.next?.next
        }
        
        return startNode
    }
    
    //题目：定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的头结点
    
    func reverseNodeList(head:ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var headNode:ListNode? = head
        var reverseHeadNode:ListNode?
        var preNode:ListNode?
        
    
        while headNode != nil {
            let tempNode = headNode?.next // 保留继续循环的节点
            if  tempNode == nil {
                reverseHeadNode = headNode // 最终返回的节点
            }
            
            headNode?.next = preNode
            preNode = headNode
            
            headNode = tempNode
  
        }
        return reverseHeadNode
    }
    
    func mergeSortList(head:ListNode?,nextHead:ListNode?) -> ListNode? {
        if  head == nil {
            return nextHead
        }
        
        if nextHead == nil {
            return head
        }
        
        var mergeHead:ListNode?
        
        if (head?.value)! < (nextHead?.value)! {
            mergeHead = head
            mergeHead?.next = mergeSortList(head: head?.next, nextHead: nextHead)
        } else {
            mergeHead = nextHead
            mergeHead?.next = mergeSortList(head: nextHead?.next, nextHead: head)
        }
        
        return mergeHead
    }
    
    
    func findFirstCommon(firstHead:ListNode?,nextHead:ListNode?) -> ListNode? {
        if firstHead == nil || nextHead == nil {
            return nil
        }
        var commonNode:ListNode?
        
        let firstlen:Int = listNodeLength(node: firstHead)
        let nextlen:Int = listNodeLength(node: nextHead)
        
        var firstTempNode:ListNode? = firstHead
        var nextTempNode:ListNode? = nextHead
         var gap:Int = 0
        if firstlen > nextlen {
            gap = firstlen - nextlen
            var count:Int = 0
            while firstTempNode != nil && count < gap {
                count += 1
                firstTempNode = firstTempNode?.next
            }
            
        } else {
             gap = nextlen - firstlen
        }
        
        while firstTempNode != nil && nextTempNode != nil {
            let value1:Int = firstTempNode!.value!
            let value2:Int = nextTempNode!.value!
            if value1 == value2 {
                commonNode = firstTempNode
                break
            }
            firstTempNode = firstTempNode?.next
            nextTempNode = nextTempNode?.next
        }
        
        
        return commonNode
    }
    
    func listNodeLength(node:ListNode?) -> Int {
        if node == nil {
            return 0
        }
        var count:Int = 0
        var tempNode:ListNode? = node
        while tempNode != nil {
            count += 1
            tempNode = tempNode?.next
        }
        return count
    }
    
}
