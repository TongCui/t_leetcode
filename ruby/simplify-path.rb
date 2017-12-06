#!/usr/bin/env ruby

# Given an absolute path for a file (Unix-style), simplify it.

# For example,
# path = "/home/", => "/home"
# path = "/a/./b/../../c/", => "/c"

# @param {String} path
# @return {String}
def simplify_path(path)
  components = []
  path.split("/").each do |component|
    case component
    when ""
    when "."
    when ".."
      components.pop
    else
      components.push component
    end
  end
  "/" + components.join("/")
end

path = ARGV[0]
puts "path is #{path}"
puts "res is #{simplify_path(path)}"