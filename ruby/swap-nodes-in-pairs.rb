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
# @return {ListNode}
def swap_pairs(head)
  return nil if head.nil?
  return head if head.next.nil?

  a1 = head
  a2 = head.next
  temp = a2.next

  new_head = a2
  new_tail = nil

  while temp
    if a1 and a2
      new_tail.next = a2 if new_tail
      a2.next = a1
      a1.next = temp
    end
    new_tail = a1
    a1 = temp
    a2 = a1.next
    break unless a2
    temp = a2.next
  end

  if a1 and a2
    new_tail.next = a2 if new_tail
    a2.next = a1
    a1.next = nil
  end

  new_head
end

def node_description(head)
  values = []
  while head
    values.push head.val
    head = head.next
  end
  
  "[#{values.join('->')}]"
end

# "1->2->3->5->4"
list = ARGV[0]
nodes = list.split("->").map{|x|ListNode.new(x)}
0.upto(nodes.size - 2) { |n| nodes[n].next = nodes[n+1] }
puts node_description(nodes.first)
new_head = swap_pairs(nodes.first)
puts "res is #{node_description(new_head)}"
