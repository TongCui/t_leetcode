#!/usr/bin/env ruby

# Given a list, rotate the list to the right by k places, where k is non-negative.


# Example:

# Given 1->2->3->4->5->NULL and k = 2,

# return 4->5->1->2->3->NULL.

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head if k == 0 or head.nil? or head.next.nil?

  new_head = nil
  new_tail = nil
  temp = head
  count = 1
  
  
  while temp.next
    count += 1
    if count == k + 1
      new_tail = head
    elsif new_tail
      new_tail = new_tail.next
    end
    temp = temp.next
  end

  temp.next = head
  
  if new_tail
    new_head = new_tail.next
    new_tail.next = nil
  else
    k %= count
    
    if k == 0
      temp.next = nil
      new_head = head
    else
      new_tail = temp
      max = count - k
      count = 1
      while count <= max
        new_tail = new_tail.next
        count += 1
      end
      new_head = new_tail.next
      new_tail.next = nil
    end
  end

  new_head

end

def nodes_values(head)
  res = []
  idx = 0
  while head
    res << head.val
    head = head.next
    idx += 1
    break if idx >=20
  end
  res
end

nodes = (1..5).map {|x| ListNode.new(x)}

nodes.each_with_index {|node, idx| node.next = nodes[idx + 1] if idx < nodes.size - 1}

puts "nodes #{ nodes_values(nodes[0])}"
head = rotate_right(nodes[0], ARGV[0].to_i)
puts "res is #{nodes_values(head)}"


