#!/usr/bin/env ruby

# Given a collection of intervals, merge all overlapping intervals.

# For example,
# Given [1,3],[2,6],[8,10],[15,18],
# return [1,6],[8,10],[15,18].

# Definition for an interval.
class Interval
    attr_accessor :start, :end
    def initialize(s=0, e=0)
        @start = s
        @end = e
    end
end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  return [] if intervals.empty?

  intervals.sort { |a, b| a.start <=> b.start }

  last = intervals[0]
  res = [last]
  1.upto(intervals.size - 1) do |i|
    cur = intervals[i]
    if last.end >= cur.start
      last.end = [last.end, cur.end].max
    else
      res << cur
      last = cur
    end
  end
  
  res
end