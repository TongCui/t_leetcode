//
//  TCodeTests.swift
//  t_code_tests
//
//  Created by tcui on 7/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import XCTest
@testable import t_code

class TCodeTests: XCTestCase {
    
    func testTwoSum() {
        
        let nums = [2, 7, 11, 15]
        let target = 9
        let res = TwoSum.Solution().twoSum(nums, target)
        
        XCTAssertEqual(res, [0, 1])
        
    }
    
    func testTwoSum1() {
        
        let nums = [2, 7, 11, 15, 17]
        let target = 19
        let res = TwoSum.Solution().twoSum(nums, target)
        
        XCTAssertEqual(res, [0, 4])
        
    }
    
    
    func testReverseInteger() {
        let num = 123
        let res = ReverseInteger.Solution().reverse(num)
        
        XCTAssertEqual(res, 321)
    }
    
    
    func testReverseInteger1() {
        let num = 2147483648
        let res = ReverseInteger.Solution().reverse(num)
        
        XCTAssertEqual(res, 0)
    }
    
    func testReverseInteger2() {
        let num = -12345
        let res = ReverseInteger.Solution().reverse(num)
        
        XCTAssertEqual(res, -54321)
    }
    
    func testReverseInteger3() {
        let num = 10
        let res = ReverseInteger.Solution().reverse(num)
        
        XCTAssertEqual(res, 1)
    }
    
    func testPalindromeNumber() {
        let num = 12321
        let res = PalindromeNumber.Solution().isPalindrome(num)
        XCTAssertEqual(res, true)
    }
    
    func testPalindromeNumber1() {
        let num = 123321
        let res = PalindromeNumber.Solution().isPalindrome(num)
        XCTAssertEqual(res, true)
    }
    
    func testPalindromeNumber2() {
        let num = 123322
        let res = PalindromeNumber.Solution().isPalindrome(num)
        XCTAssertEqual(res, false)
    }
    
    func testRomanToInteger() {
        let s = "MCMXCIV"
        let res = RomanToInteger.Solution().romanToInt(s)
        
        XCTAssertEqual(res, 1994)
    }
    
    func testLongestCommonPrefix() {
        let strs = ["flower","flow","flight"]
        let res = LongestCommonPrefix.Solution().longestCommonPrefix(strs)
        
        XCTAssertEqual(res, "fl")
    }
    
    func testLongestCommonPrefix1() {
        let strs = ["dog","racecar","car"]
        let res = LongestCommonPrefix.Solution().longestCommonPrefix(strs)
        
        XCTAssertEqual(res, "")
    }
    
    func testLongestCommonPrefix2() {
        let strs = [String]()
        let res = LongestCommonPrefix.Solution().longestCommonPrefix(strs)
        
        XCTAssertEqual(res, "")
    }
    
    
    func testLongestCommonPrefix3() {
        let strs = ["ca","a"]
        let res = LongestCommonPrefix.Solution().longestCommonPrefix(strs)
        
        XCTAssertEqual(res, "")
    }
    
    func testLongestCommonPrefixN() {
        let strs = ["flower","flow","flight"]
        let res = LongestCommonPrefix.Solution().longestCommonPrefix2(strs)
        
        XCTAssertEqual(res, "fl")
    }
    
    func testLongestCommonPrefixN1() {
        let strs = ["dog","racecar","car"]
        let res = LongestCommonPrefix.Solution().longestCommonPrefix2(strs)
        
        XCTAssertEqual(res, "")
    }
    
    func testLongestCommonPrefixN2() {
        let strs = [String]()
        let res = LongestCommonPrefix.Solution().longestCommonPrefix2(strs)
        
        XCTAssertEqual(res, "")
    }
    
    
    func testLongestCommonPrefixN3() {
        let strs = ["ca","a"]
        let res = LongestCommonPrefix.Solution().longestCommonPrefix2(strs)
        
        XCTAssertEqual(res, "")
    }
    
    func testValidParentheses() {
        var str = ""
        var res = ValidParentheses.Solution().isValid(str)
        XCTAssertEqual(res, true)
        
        str = "()"
        res = ValidParentheses.Solution().isValid(str)
        XCTAssertEqual(res, true)
        
        str = "()[]{}"
        res = ValidParentheses.Solution().isValid(str)
        XCTAssertEqual(res, true)
        
        str = "(]"
        res = ValidParentheses.Solution().isValid(str)
        XCTAssertEqual(res, false)
        
        str = "([)]"
        res = ValidParentheses.Solution().isValid(str)
        XCTAssertEqual(res, false)
        
        str = "{[]}"
        res = ValidParentheses.Solution().isValid(str)
        XCTAssertEqual(res, true)
        
        str = "]["
        res = ValidParentheses.Solution().isValid(str)
        XCTAssertEqual(res, false)
    }
    
    func testMergeTwoSortedLists() {
        var node1: ListNode?
        var node2: ListNode?
        var res: ListNode?
        
        node1 = ListNode.node(string: "1->2->4")
        node2 = ListNode.node(string: "1->3->4")
        res = MergeTwoSortedLists.Solution().mergeTwoLists(node1, node2)
        XCTAssertEqual(res?.description ?? "", "1->1->2->3->4->4")
        
        node1 = ListNode.node(string: "1->2->4")
        node2 = ListNode.node(string: "")
        res = MergeTwoSortedLists.Solution().mergeTwoLists(node1, node2)
        XCTAssertEqual(res?.description ?? "", "1->2->4")
        
        node1 = ListNode.node(string: "1")
        node2 = ListNode.node(string: "1->3->4")
        res = MergeTwoSortedLists.Solution().mergeTwoLists(node1, node2)
        XCTAssertEqual(res?.description ?? "", "1->1->3->4")
        
    }
    
    func testMergeTwoSortedLists1() {
        var node1: ListNode?
        var node2: ListNode?
        var res: ListNode?
        
        node1 = ListNode.node(string: "1->2->4")
        node2 = ListNode.node(string: "1->3->4")
        res = MergeTwoSortedLists.Solution().mergeTwoLists1(node1, node2)
        XCTAssertEqual(res?.description ?? "", "1->1->2->3->4->4")
        
        node1 = ListNode.node(string: "1->2->4")
        node2 = ListNode.node(string: "")
        res = MergeTwoSortedLists.Solution().mergeTwoLists1(node1, node2)
        XCTAssertEqual(res?.description ?? "", "1->2->4")
        
        node1 = ListNode.node(string: "1")
        node2 = ListNode.node(string: "1->3->4")
        res = MergeTwoSortedLists.Solution().mergeTwoLists1(node1, node2)
        XCTAssertEqual(res?.description ?? "", "1->1->3->4")
    }
    
    func testRemoveDuplicatesFromSortedArray() {
        var nums: [Int]
        var res: Int
            
        nums = [1,1,2]
        res = RemoveDuplicatesFromSortedArray.Solution().removeDuplicates(&nums)
        XCTAssertEqual(res, 2)
        XCTAssertEqual(nums[..<res], [1,2])
        
        nums = []
        res = RemoveDuplicatesFromSortedArray.Solution().removeDuplicates(&nums)
        XCTAssertEqual(res, 0)
        XCTAssertEqual(nums, [])
        
        nums = [0,0,1,1,1,2,2,3,3,4]
        res = RemoveDuplicatesFromSortedArray.Solution().removeDuplicates(&nums)
        XCTAssertEqual(res, 5)
        XCTAssertEqual(nums[..<res], [0,1,2,3,4])
    }
    
    func testRemoveElement() {
        var nums: [Int]
        var val: Int
        var res: Int
        
        nums = [3,2,2,3]
        val = 3
        res = RemoveElement.Solution().removeElement(&nums, val)
        XCTAssertEqual(res, 2)
        XCTAssertEqual(nums[..<res], [2,2])
        
        nums = []
        val = 10
        res = RemoveElement.Solution().removeElement(&nums, val)
        XCTAssertEqual(res, 0)
        XCTAssertEqual(nums, [])
        
        nums = [0,1,2,2,3,0,4,2]
        val = 2
        res = RemoveElement.Solution().removeElement(&nums, val)
        XCTAssertEqual(res, 5)
        XCTAssertEqual(nums[..<res], [0,1,3,0,4])
    }
    
    func testImplementStr() {
        var str: String
        var needle: String
        var res: Int
        
        str = "hello"
        needle = "ll"
        res = ImplementStr.Solution().strStr(str, needle)
        XCTAssertEqual(res, 2)
        
        
        str = "hello"
        needle = ""
        res = ImplementStr.Solution().strStr(str, needle)
        XCTAssertEqual(res, 0)
        
        str = "aaaaaa"
        needle = "bba"
        res = ImplementStr.Solution().strStr(str, needle)
        XCTAssertEqual(res, -1)
    }
    
    func testSearchInsertPosition() {
        var list: [Int]
        var target: Int
        var res: Int
        
        list = [1,3,5,6]
        target = 5
        res = SearchInsertPosition.Solution().searchInsert(list, target)
        XCTAssertEqual(res, 2)
        
        list = [1,3,5,6]
        target = 2
        res = SearchInsertPosition.Solution().searchInsert(list, target)
        XCTAssertEqual(res, 1)
        
        list = [1,3,5,6]
        target = 7
        res = SearchInsertPosition.Solution().searchInsert(list, target)
        XCTAssertEqual(res, 4)
        
        list = [1,3,5,6]
        target = 0
        res = SearchInsertPosition.Solution().searchInsert(list, target)
        XCTAssertEqual(res, 0)
    }
    
    func testCountAndSay() {
        var count: Int
        var res: String
        
        count = 1
        res = CountAndSay.Solution().countAndSay(count)
        XCTAssertEqual(res, "1")
        
        count = 2
        res = CountAndSay.Solution().countAndSay(count)
        XCTAssertEqual(res, "11")
        
        count = 3
        res = CountAndSay.Solution().countAndSay(count)
        XCTAssertEqual(res, "21")
        
        count = 4
        res = CountAndSay.Solution().countAndSay(count)
        XCTAssertEqual(res, "1211")
        
        count = 5
        res = CountAndSay.Solution().countAndSay(count)
        XCTAssertEqual(res, "111221")
    }
    
    func testMaximumSubarray() {
        var nums: [Int]
        var res: Int
        
        nums = [-2,1,-3,4,-1,2,1,-5,4]
        res = MaximumSubarray.Solution().maxSubArray(nums)
        XCTAssertEqual(res, 6)
        
        nums = [1,2]
        res = MaximumSubarray.Solution().maxSubArray(nums)
        XCTAssertEqual(res, 3)
    }
    
    func testLengthOfLastWord() {
        var word: String
        var res: Int
        
        word = "Hello World"
        res = LengthOfLastWord.Solution().lengthOfLastWord(word)
        XCTAssertEqual(res, 5)
        
        word = "a   "
        res = LengthOfLastWord.Solution().lengthOfLastWord(word)
        XCTAssertEqual(res, 1)
    }
    
    func testPlusOne() {
        var nums: [Int]
        var res: [Int]
        
        nums = [1,2,3]
        res = PlusOne.Solution().plusOne(nums)
        XCTAssertEqual(res, [1,2,4])
        
        nums = [4,3,2,1]
        res = PlusOne.Solution().plusOne(nums)
        XCTAssertEqual(res, [4,3,2,2])
        
        nums = [0]
        res = PlusOne.Solution().plusOne(nums)
        XCTAssertEqual(res, [1])
        
        nums = [9]
        res = PlusOne.Solution().plusOne(nums)
        XCTAssertEqual(res, [1,0])
        
        nums = [9,9,9]
        res = PlusOne.Solution().plusOne(nums)
        XCTAssertEqual(res, [1,0,0,0])
    }
    
    func testAddBinary() {
        var numa = ""
        var numb = ""
        var res = ""
        
        numa = "11"
        numb = "1"
        res = AddBinary.Solution().addBinary(numa, numb)
        XCTAssertEqual(res, "100")
        
        
        numa = "1010"
        numb = "1011"
        res = AddBinary.Solution().addBinary(numa, numb)
        XCTAssertEqual(res, "10101")
        
    }
    
    func testAddBinary1() {
        var numa = ""
        var numb = ""
        var res = ""
        
        numa = "11"
        numb = "1"
        res = AddBinary.Solution().addBinary1(numa, numb)
        XCTAssertEqual(res, "100")
        
        
        numa = "1010"
        numb = "1011"
        res = AddBinary.Solution().addBinary1(numa, numb)
        XCTAssertEqual(res, "10101")
    }
    
    func testSqrtX() {
        var num: Int
        var res: Int
        
        num = 4
        res = SqrtX.Solution().mySqrt(num)
        XCTAssertEqual(res, 2)
        
        num = 8
        res = SqrtX.Solution().mySqrt(num)
        XCTAssertEqual(res, 2)
    }
    
    func testSqrtX1() {
        var num: Int
        var res: Int
        
        num = 4
        res = SqrtX.Solution().mySqrt1(num)
        XCTAssertEqual(res, 2)
        
        num = 8
        res = SqrtX.Solution().mySqrt1(num)
        XCTAssertEqual(res, 2)
    }
    
    func testClimbingStairs() {
        var stairs: Int
        var res: Int
        
        stairs = 1
        res = ClimbingStairs.Solution().climbStairs(stairs)
        XCTAssertEqual(res, 1)
        
        stairs = 2
        res = ClimbingStairs.Solution().climbStairs(stairs)
        XCTAssertEqual(res, 2)
        
        stairs = 3
        res = ClimbingStairs.Solution().climbStairs(stairs)
        XCTAssertEqual(res, 3)
    }
}
