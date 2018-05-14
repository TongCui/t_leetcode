//
//  MergeKSortedLists.swift
//  t_code
//
//  Created by tcui on 14/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 
 Example:
 
 Input:
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 Output: 1->1->2->3->4->4->5->6
 */

class MergeKSortedLists {
    class Solution {
        func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
            var nodes = lists.flatMap { (list) -> [ListNode] in
                var nodes = [ListNode]()
                var head = list
                while let cur = head {
                    nodes.append(cur)
                    head = head?.next
                }
                
                return nodes
            }
            
            nodes.sort { (lhs, rhs) in
                lhs.val < rhs.val
            }
            
            for (idx, node) in nodes.enumerated() {
                if idx == nodes.count - 1 {
                    node.next = nil
                } else {
                    node.next = nodes[idx + 1]
                }
            }
            
            return nodes.first
        }
        
    }
}
