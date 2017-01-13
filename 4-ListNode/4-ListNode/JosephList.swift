//
//  JosephList.swift
//  4-ListNode
//
//  Created by FlyElephant on 17/1/13.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class JosephList {
    
    func createList(number:Int)->ListNode? {
        if number < 1 {
            return nil
        }
        let headNode:ListNode = ListNode()
        headNode.value = 0
        
        var preNode:ListNode = headNode
        for i in 1..<number {
            let node:ListNode = ListNode()
            node.value = i
            preNode.next = node
            if i == number - 1{
                node.next = headNode
            } else {
                preNode = node
            }
        }
        return headNode
    }
    
    func printList(headNode:ListNode,number:Int) {
        var count:Int = 0
        var tempNode:ListNode = headNode
        while count <= number {
            print("临时节点的值---\(tempNode.value!)")
            tempNode = tempNode.next!
            count += 1
        }
    }
    
    
    func josephLastNumber(number:Int,m:Int)->Int {
        if number < 1 || m < 1 {
            return -1
        }
        let lastNumber:Int = 0
        
        if number >= 2 {
            var currentNode:ListNode? = createList(number: number)
            var preNode:ListNode? = headNode
            var count:Int = 1
            while currentNode != nil {
                if  count == m {
                    currentNode = currentNode?.next
                    preNode?.next = currentNode?.next
                } else {
                    preNode = currentNode
                    currentNode = currentNode?.next
                    count += 1
                }

            }
        }
        
        return lastNumber
    }
    
}
