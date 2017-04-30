//
//  ListNodeManager.swift
//  11-GoldenInterview
//
//  Created by keso on 2017/4/22.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class ListNodeSum {
    var node:ListNode?
    var carry:Int = 0
}

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
            print("\(node!.value!)", terminator: " ")
            node = node?.next
        }
        print("")
    }
    
    // 2.1. 移除未排序链表中的重复结点
    
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
    
    // 2.2 倒数第k个节点
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
    
    // 2.3 链表切分
    
    func partitionListNode(node:ListNode,x:Int) -> ListNode {
        
        var beforeStart:ListNode?
        var beforeEnd:ListNode?
        
        var afterStart:ListNode?
        var afterEnd:ListNode?
        
        var listNode:ListNode? = node
        
        while listNode != nil {
            let next:ListNode? = listNode?.next
            
            let value:Int = Int((listNode?.value)!)!
            
            if value < x {
                if beforeStart == nil { // 插入beforeStart之后
                    beforeStart = listNode
                    beforeEnd = listNode
                } else {
                    beforeEnd?.next = listNode
                    beforeEnd = listNode
                }
            } else {
                if afterStart == nil { // 插入afterStart之后
                    afterStart = listNode
                    afterEnd = listNode
                } else {
                    afterEnd?.next = listNode
                    afterEnd = listNode
                }
            }
            listNode = next
        }
        
        if beforeStart == nil {
            return afterStart!
        }
        
        beforeEnd?.next = afterStart
        
        return beforeStart!
    }
    
    func partitionListNode2(node:ListNode,x:Int) -> ListNode {
        
        var beforeStart:ListNode?
        var afterStart:ListNode?
        
        var listNode:ListNode? = node
        
        while listNode != nil {
            let next:ListNode? = listNode?.next
            let value:Int = Int((listNode?.value)!)!
            
            if value < x {
                listNode?.next = beforeStart
                beforeStart = listNode
            } else {
                listNode?.next = afterStart
                afterStart = listNode
            }
            
            listNode = next
        }
        
        if beforeStart == nil {
            return afterStart!
        }
        
        
        let head:ListNode = beforeStart!
        
        while beforeStart?.next != nil { // 找到beforeStart的最后节点
            beforeStart = beforeStart?.next
        }
        
        beforeStart?.next = afterStart
        
        return head
    }
    
    // 2.5 链表加法
    func addListNode(node1:ListNode,node2:ListNode) -> ListNode {
        
        var first:ListNode? = node1
        var second:ListNode? = node2
        
        var result:ListNode?
        
        var carry:Int = 0
        
        while first != nil || second != nil {
            
            var num1:Int = 0
            if (first?.value) != nil {
                num1 = Int((first?.value)!)!
            }
            
            var num2:Int = 0
            if second?.value != nil {
                num2 = Int((second?.value)!)!
            }
            
            let value:Int = num1 + num2 + carry
            
            let mod:Int = value % 10
            carry = value / 10
            
             let node:ListNode = ListNode(value: "\(mod)")
            if result == nil {
                result = node
            } else {
                var nextNode:ListNode? = result
                while nextNode?.next != nil {
                    nextNode = nextNode?.next
                }
                nextNode?.next = node
            }
            
            first = first?.next
            second = second?.next
        }
        
        return result!
    }
    
    
    func addListNode1(node1:ListNode?,node2:ListNode?,carry:Int) -> ListNode? {
        
        if node1 == nil && node2 == nil && carry == 0 {
            return nil
        }
        
        var value:Int = carry
        
        if node1?.value != nil {
            value += Int((node1?.value)!)!
        }
        
        if node2?.value != nil {
            value += Int((node2?.value)!)!
        }
        
        let mod:Int = value % 10
        let nextCarry:Int = value / 10
        
        let result:ListNode = ListNode(value: "\(mod)")
        let nextNode:ListNode? = addListNode1(node1: node1?.next, node2: node2?.next, carry: nextCarry)
        result.next = nextNode
        return result
    }
    
    // 2.5 链表正向相加
    
    func listNodeCount(listNode:ListNode) -> Int {
        
        var node:ListNode? = listNode
        var count:Int = 0
        
        while node != nil {
            count += 1
            node = node?.next
        }
        return count
    }
    
    func paddingListNode(node:ListNode,padding:Int) -> ListNode {
        
        var head:ListNode = node
        
        for _ in 0..<padding {
            let listNode:ListNode = ListNode(value: "\(0)")
            listNode.next = head
            head = listNode
        }
        
        return head
    }
    
    func insertBefore(node:ListNode?,value:Int) -> ListNode {
        
        let listNode:ListNode = ListNode(value: "\(value)")
        listNode.next = node
        return listNode
    }
    
    func addListNode3(node1:ListNode,node2:ListNode) -> ListNode? {
        
        let count1:Int = listNodeCount(listNode: node1)
        let count2:Int = listNodeCount(listNode: node2)
        
        var first:ListNode = node1
        var second:ListNode = node2
        
        if count1 > count2 {
            second = paddingListNode(node: second, padding: count1 - count2)
        } else {
            first = paddingListNode(node: first, padding: count2 - count1)
        }
        
        let sumNode:ListNodeSum? = addListHelper(node1: first, node2: second)
        
        if sumNode?.node != nil {
            if sumNode?.carry == 0 {
                return sumNode?.node
            } else {
                let result:ListNode = insertBefore(node: sumNode?.node, value: (sumNode?.carry)!)
                return result
            }
        }
        return nil
    }
    
    
    func addListHelper(node1:ListNode?,node2:ListNode?) -> ListNodeSum? {
        if node1 == nil && node2 == nil {
            return ListNodeSum()
        }
        
        let sumNode:ListNodeSum? = addListHelper(node1: node1?.next, node2: node2?.next)
        
        var value:Int = 0
        
        if node1?.value != nil {
            value += Int((node1?.value)!)!
        }
        
        if node2?.value != nil {
            value += Int((node2?.value)!)!
        }
        
        if sumNode != nil {
            value += (sumNode?.carry)!
        }
        
        let fullNode:ListNode? = insertBefore(node: sumNode?.node, value: value % 10)
        sumNode?.carry = value / 10
        sumNode?.node = fullNode
        
        return sumNode
    }
    
    // 2.6 环路开头结点
    func findBeginingNode(headNode:ListNode) -> ListNode? {
        
        var slow:ListNode? = headNode
        var fast:ListNode? = headNode
        
        // 环路节点相交
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow?.value == fast?.value {
                break
            }
        }
        
        // 校验
        if fast == nil || fast?.next == nil {
            return nil
        }
        
        // 重置开始节点
        slow = headNode
        while slow?.value != fast?.value {
            slow = slow?.next
            fast = fast?.next
        }
        
        return fast
    }
    
    // 2.7 是否是回文链表
    
    func isPalindrome(node:ListNode) -> Bool {
        
        var headNode:ListNode? = node
        var preNode:ListNode?
        var reverseHeadNode:ListNode?
        
        while headNode != nil {
            let next:ListNode? = headNode?.next
            
            if next == nil {
                reverseHeadNode = headNode
            }
            
            headNode?.next = preNode
            preNode = headNode
            
            headNode = next
        }
        
        headNode = node
        while headNode != nil {
            if  headNode?.value != reverseHeadNode?.value {
                return false
            }
            headNode = headNode?.next
            reverseHeadNode = reverseHeadNode?.next
        }
        return true
    }
    
    func isPalindrome1(node:ListNode) -> Bool {

        var list:[String?] = []
        
        var slow:ListNode? = node
        var fast:ListNode? = node
        
        while fast != nil && fast?.next != nil {
            list.append(slow?.value)
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // 奇数个元素，跳过中间元素
        if fast != nil {
            slow = slow?.next
        }
        
        while slow != nil {
            let data:String? = list.last!
            list.removeLast()
            if  slow?.value != data {
                return false
            }
            slow = slow?.next
        }
        
        return true
    }
    
}
