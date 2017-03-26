//
//  DeleteNode.swift
//  4-ListNode
//
//  Created by keso on 2017/3/26.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class DeleteNode {
    
    func deleteNode(currentNode:ListNode) {
        
        let next:ListNode? = currentNode.next
        
        if next != nil {
            currentNode.next = next?.next
            currentNode.value = next?.value
        }
        
    }
    
}
