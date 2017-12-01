class Solution {
    func isPalindrome(_ s:String, from i:String.Index, to j:String.Index) -> Bool {
        let distance = s.distance(from: i, to: j)
        if distance == 1 {
            return true
        } else if distance == 2 {
            return s[i] == s[j]
        } else {
            return isPalindrome(s, from:s.index(after: i) ,to: s.index(before: j))
        }
    }
    
    func longestPalindrome(_ s: String) -> String {
        var maxI = s.startIndex
        var maxJ = s.startIndex
        var maxLength = s.distance(from: maxI, to: maxI)
        
        let offsets = [-1, 0, 1]
        
        for j in 1..<s.count {
            print("row \(j)")
            let curJ = s.index(s.startIndex, offsetBy: j)
            
            // print("cur j \(s.distance(from: s.startIndex, to: curJ))")
            for offset in offsets {
                let curI = s.index(curJ, offsetBy: -maxLength + offset)
                
                if curI >= s.startIndex && curI <= curJ {
                    print("substring is \(s[curI...curJ])")
                    if s[curI] == s[curJ] && isPalindrome(s, from: curI, to: curJ) {
                        maxI = curI
                        maxJ = curJ
                        maxLength = s.distance(from: maxI, to: maxJ)
                    }
                }
            }
        }
 
        
        return s
    }
    
}

var words = [String]()
words.append("abba")
//words.append("abbaaaaaaaaa")
let solution = Solution()
words.forEach { word in
    print("\(word) - \(solution.longestPalindrome(word))")
}
