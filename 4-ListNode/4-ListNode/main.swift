//
//  main.swift
//  4-ListNode
//
//  Created by FlyElephant on 16/6/12.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import Foundation

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

//var listManager:ListNodeManager = ListNodeManager()
//var head:ListNode?
//var firstNode:ListNode?
//var deleteNode:ListNode?
//listManager.createList(&head, data: 11)
//firstNode = head
//
//listManager.createList(&head, data: 12)
//listManager.createList(&head, data: 13)
//deleteNode = head
//listManager.createList(&head, data: 14)
//listManager.createList(&head, data: 15)
//
//listManager.deleteNode(head: &firstNode, toBeDeleted: &deleteNode)
//print("FlyElephant")
//listManager.printList(firstNode)



var searchManager:ListNodeManager = ListNodeManager()
var headNode:ListNode?
var searchHeadNode:ListNode?
searchManager.createList(&headNode, data: 1)
searchHeadNode = headNode

searchManager.createList(&headNode, data: 2)
searchManager.createList(&headNode, data: 3)
searchManager.createList(&headNode, data: 4)
searchManager.createList(&headNode, data: 5)
searchManager.createList(&headNode, data: 6)
searchManager.createList(&headNode, data: 7)
searchManager.createList(&headNode, data: 8)
searchManager.createList(&headNode, data: 9)


var searchNode:SearchNode = SearchNode()

var reverseNode:ListNode? = searchNode.reverseNodeList(head: searchHeadNode)
//searchNode.printList(reverseNode)

var mergeHeadNode:ListNode?
var mergeHead1:ListNode?
searchNode.createList(&mergeHeadNode, data: 1)
mergeHead1 = mergeHeadNode

searchNode.createList(&mergeHeadNode, data: 3)
searchNode.createList(&mergeHeadNode, data: 5)
searchNode.createList(&mergeHeadNode, data: 7)

var mergeHeadNode2:ListNode?
var mergeHead2:ListNode?
searchNode.createList(&mergeHeadNode2, data: 2)
mergeHead2 = mergeHeadNode2

searchNode.createList(&mergeHeadNode2, data: 4)
searchNode.createList(&mergeHeadNode2, data: 6)
searchNode.createList(&mergeHeadNode2, data: 8)

searchNode.printList(mergeHead1)
searchNode.printList(mergeHead2)

var mergeResultNode:ListNode? = searchNode.mergeSortList(head: mergeHead1, nextHead: mergeHead2)
searchNode.printList(mergeResultNode)


//var resultNode:ListNode? = searchNode.findNodeByDescendIndex(head: searchHeadNode, index: 3)
//if resultNode != nil {
//    print("FlyElephant-节点的Value--\(resultNode!.value!)")
//} else {
//    print("节点没有值")
//}
//
//var centerNode:ListNode? = searchNode.findCenterNode(head: searchHeadNode)
//if centerNode != nil {
//    print("FlyElephant-中点的Value--\(centerNode!.value!)")
//} else {
//    print("中点没有值")
//}




