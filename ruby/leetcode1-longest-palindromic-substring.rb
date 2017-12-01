#!/usr/bin/env ruby

def longest_palindrome(s)
  chars = s.chars
  size = s.size

  # palindrome[i][j] book
  palindrome_book = Array.new(size) do |i|
    Array.new(size) do |j|
      i == j
    end
  end

  # equal[i][j] book
  equal_book = Array.new(size) do |i|
    Array.new(size) do |j|
      chars[i] == chars[j]
    end
  end

  max_length = 1
  max_i = 0
  max_j = 0

  # build palindrome_book
  (2..size).each do |distance|
    (0..(size - distance)).each do |i|
      j = i + distance - 1
      
      if i == j
        check_result = true
      elsif i + 1 == j
        check_result = equal_book[i][j]
      else
        check_result = equal_book[i][j] && palindrome_book[i + 1][j - 1]
      end
      
      palindrome_book[i][j] = check_result
      # puts "Compute distance(#{distance}) [#{i} - #{j}] (#{palindrome_book[i][j]})"
      if check_result && distance > max_length
        max_length = distance
        max_i = i
        max_j = j
      end
    end
    if distance > max_length + 1
      # puts "Skip Left"
      return chars[max_i..max_j].join
    end
  end

  chars[max_i..max_j].join
end



words = []
words.push "apqjpwedlhmvvpexxnntxheeynxmgzwxhnhfdvziuxnuusymklgcacndoyhqkoahnkyaikohwkmnuphipftmzmihvmoetskioeypwjujvvusaxynzxxdugnebsisrtgeujkqkgwjuplijhluumqcdurovyjsbowmnqndejwkihzbbdyxjunkduyqeihektaknbmkzgnnmgywylulxwyywrvieqfenjeljofkqqqisdjsbfkvqgahxwkfkcucvrbbpyhwkfztjdboavtfynrudneieelwlcezqsuhmllcsadcnoyemsfdlrijoyj"
words.push "abbacdabcd"
words.push "a"
words.push "cbbd"
words.push "bb"
words.push "babad"
words.each do |word|
  puts "======="
  res = longest_palindrome(word)
  puts "#{word} - #{res}"
end


