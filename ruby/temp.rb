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

  # palindrome_length_book[i] book
  palindrome_length_book = Array.new(size + 1) {false}
  palindrome_length_book[0] = true
  palindrome_length_book[1] = true

  max_length = 1
  max_i = 0
  max_j = 0

  # build palindrome_book
  for distance in (2..size)
    if distance > max_length + 2
      # puts "Skip Left"
      return chars[max_i..max_j].join
    end

    next unless palindrome_length_book[distance - 2]

    for i in (0..(size - distance))
      j = i + distance - 1
      
      check_result = false
      if i == j
        check_result = true
      elsif chars[i] == chars[j]
        if  i + 1 == j
          check_result = true
        else
          check_result = palindrome_book[i + 1][j - 1]
        end
      end
      
      palindrome_book[i][j] = check_result
      # puts "Compute distance(#{distance}) [#{i} - #{j}] (#{palindrome_book[i][j]})"
      if check_result && distance > max_length
        palindrome_length_book[distance] = true
        max_length = distance
        max_i = i
        max_j = j
      end
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
words.push "mwwfjysbkebpdjyabcfkgprtxpwvhglddhmvaprcvrnuxifcrjpdgnktvmggmguiiquibmtviwjsqwtchkqgxqwljouunurcdtoeygdqmijdympcamawnlzsxucbpqtuwkjfqnzvvvigifyvymfhtppqamlgjozvebygkxawcbwtouaankxsjrteeijpuzbsfsjwxejtfrancoekxgfyangvzjkdskhssdjvkvdskjtiybqgsmpxmghvvicmjxqtxdowkjhmlnfcpbtwvtmjhnzntxyfxyinmqzivxkwigkondghzmbioelmepgfttczskvqfejfiibxjcuyevvpawybcvvxtxycrfbcnpvkzryrqujqaqhoagdmofgdcbhvlwgwmsmhomknbanvntspvvhvccedzzngdywuccxrnzbtchisdwsrfdqpcwknwqvalczznilujdrlevncdsyuhnpmheukottewtkuzhookcsvctsqwwdvfjxifpfsqxpmpwospndozcdbfhselfdltmpujlnhfzjcgnbgprvopxklmlgrlbldzpnkhvhkybpgtzipzotrgzkdrqntnuaqyaplcybqyvidwcfcuxinchretgvfaepmgilbrtxgqoddzyjmmupkjqcypdpfhpkhitfegickfszermqhkwmffdizeoprmnlzbjcwfnqyvmhtdekmfhqwaftlyydirjnojbrieutjhymfpflsfemkqsoewbojwluqdckmzixwxufrdpqnwvwpbavosnvjqxqbosctttxvsbmqpnolfmapywtpfaotzmyjwnd"
words.each do |word|
  puts "======="
  res = longest_palindrome(word)
  puts "#{word} - #{res}"
end


