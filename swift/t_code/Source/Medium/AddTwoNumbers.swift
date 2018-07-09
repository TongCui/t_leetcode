//
//  AddTwoNumbers.swift
//  t_code
//
//  Created by Tong on 19/06/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

class AddTwoNumbers {
    
    class Solution {
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            
            var carry = 0
            var head1 = l1, head2 = l2
            var res: ListNode?
            var temp: ListNode?
            
            while head1 != nil || head2 != nil || carry > 0 {
                let current = ListNode(carry)
                if let node = head1 {
                    current.val += node.val
                }
                if let node = head2 {
                    current.val += node.val
                }
                if current.val > 9 {
                    current.val = current.val % 10
                    carry = 1
                } else {
                    carry = 0
                }
                print(current.val)
                
                if res == nil {
                    res = current
                    temp = current
                } else {
                    temp?.next = current
                    temp = current
                }
                
                
                head1 = head1?.next
                head2 = head2?.next
            }
            
            return res
        }
        
        func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            
            var carry = 0
            var head1 = l1, head2 = l2
            let res: ListNode? = head1
            var temp: ListNode? = res
            
            while head1 != nil || head2 != nil || carry > 0 {
                temp?.val = carry + (head1?.val ?? 0) + (head2?.val ?? 0)
                
                if temp!.val > 9 {
                    temp?.val = temp!.val % 10
                    carry = 1
                } else {
                    carry = 0
                }
                
                head1 = head1?.next
                head2 = head2?.next
                
                if head1 == nil && head2 == nil {
                    if carry > 0 {
                        temp?.next = ListNode(carry)
                    } else {
                        temp?.next = nil
                        break
                    }
                } else if head2 == nil {
                    temp?.next = head1
                    if carry == 0 {
                        break
                    }
                } else if head1 == nil{
                    temp?.next = head2
                    if carry == 0 {
                        break
                    }
                } else {
                    temp?.next = head1
                }
                
                temp = temp?.next
            }
            
            return res
        }
    }
    
}
