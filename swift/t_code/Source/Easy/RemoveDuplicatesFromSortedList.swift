//
//  RemoveDuplicatesFromSortedList.swift
//  t_code
//
//  Created by tcui on 10/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 
     Given a sorted linked list, delete all duplicates such that each element appear only once.
 
     Example 1:
 
     Input: 1->1->2
     Output: 1->2
     Example 2:
 
     Input: 1->1->2->3->3
     Output: 1->2->3
 
 */

class RemoveDuplicatesFromSortedList {
    
    class Solution {
        func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            let res: ListNode? = head
            var tail: ListNode? = head?.next
            var resTail: ListNode? = head
            
            while tail != nil {
                if resTail!.val != tail!.val {
                    resTail?.next = tail
                    resTail = tail
                } else {
                    resTail?.next = nil
                }
                
                tail = tail?.next
            }
            
            return res
        }
    }
}
