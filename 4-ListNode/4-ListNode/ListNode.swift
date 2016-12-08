//
//  ListNode.swift
//  4-ListNode
//
//  Created by FlyElephant on 16/6/12.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

class ListNode: NSObject {
    var value:Int?
    var next:ListNode?
}

class ListNodeManager {
    
    
    func printList(head:ListNode?) {
        var node:ListNode? = head
        while node != nil {
            print("\(node!.value!)")
            node = node?.next
        }
    }
    
    func createList(head:inout ListNode?,data:Int) {
        let node:ListNode = ListNode()
        node.value = data
        if head == nil {
            node.next = nil
        } else {
            head?.next = node
        }
        head = node
    }
    
    func deleteNode(head:inout ListNode?,toBeDeleted:inout ListNode?) {
        var node:ListNode?
        guard let headNode = head,let deleteNode = toBeDeleted else {
            return
        }
        
        if head == toBeDeleted { //删除是表头
            node = headNode.next!
            head = node
        } else {
            if deleteNode.next == nil { // 删除的最后节点是尾节点
                node = headNode
                while node?.next != toBeDeleted {
                    node = node?.next
                }
                node?.next = nil
            } else {
                node = deleteNode.next!
                deleteNode.value = node?.value
                deleteNode.next = node?.next
            }
        }
    }
    
    func reverseListNode(_ node:ListNode?) {
        if (node != nil) {
            if ((node?.next) != nil) {
                reverseListNode(node?.next!)
            }
            
            if let nodeValue = node?.value! {
                print("\(nodeValue)")
            }
        }
    }
}

