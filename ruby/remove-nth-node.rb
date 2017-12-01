#!/usr/bin/env ruby

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return nil if head.next.nil? and n == 1

  temp = head
  pre_n_1th_node = nil
  idx = 0
  while temp
    if idx == n
      pre_n_1th_node = head
    elsif not pre_n_1th_node.nil?
      pre_n_1th_node = pre_n_1th_node.next
    end

    idx += 1
    temp = temp.next
  end

  if pre_n_1th_node.nil?
    return head.next
  else
    pre_n_1th_node.next = pre_n_1th_node.next.next
    return head
  end
end