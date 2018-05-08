//
//  MergeTwoSortedLists.swift
//  t_code
//
//  Created by tcui on 8/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

/*
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 Example:
 
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4

 
 */

class ListNode: CustomStringConvertible {
    typealias StringLiteralType = String
    
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    var description: String {
        var values = [Int]()
        var temp: ListNode? = self
        while let cur = temp {
            values.append(cur.val)
            temp = temp?.next
        }
        
        return values.map{ "\($0)" }.joined(separator: "->")
    }
    
    class func node(string: String) -> ListNode? {
        let components = string.components(separatedBy: CharacterSet(charactersIn: "->")).compactMap { Int($0) }
        
        guard let first = components.first else {
            return nil
        }
        
        let node = ListNode(first)
        
        var temp = node
        for val in components[1...] {
            let cur = ListNode(val)
            temp.next = cur
            temp = cur
        }
        
        return node
    }
}

class MergeTwoSortedLists {
    /**
     * Definition for singly-linked list.
     * public class ListNode {
     *     public var val: Int
     *     public var next: ListNode?
     *     public init(_ val: Int) {
     *         self.val = val
     *         self.next = nil
     *     }
     * }
     */
    
    
    class Solution {
        func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            guard l1 != nil else {
                return l2
            }
            
            guard l2 != nil else {
                return l1
            }
            
            var temp1 = l1
            var temp2 = l2
            var temp: ListNode?
            var res: ListNode?
            
            if let cur1 = temp1, let cur2 = temp2 {
                if cur1.val < cur2.val {
                    res = cur1
                    temp1 = temp1?.next
                } else {
                    res = cur2
                    temp2 = temp2?.next
                }
            }
            
            temp = res
            
            while temp1 != nil || temp2 != nil {
                if let cur1 = temp1, let cur2 = temp2 {
                    if cur1.val < cur2.val {
                        temp?.next = cur1
                        temp1 = temp1?.next
                    } else {
                        temp?.next = cur2
                        temp2 = temp2?.next
                    }
                } else if let cur1 = temp1 {
                    temp?.next = cur1
                    temp1 = temp1?.next
                } else if let cur2 = temp2 {
                    temp?.next = cur2
                    temp2 = temp2?.next
                }
                
                temp = temp?.next
            }
            
            return res
        }
        
        func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            guard let l1 = l1 else {
                return l2
            }
            
            guard let l2 = l2 else {
                return l1
            }
            
            let head: ListNode
            if l1.val < l2.val {
                head = l1
                head.next = mergeTwoLists(l1.next, l2)
            } else {
                head = l2
                head.next = mergeTwoLists(l1, l2.next)
            }
            
            return head
        }
    }
}
