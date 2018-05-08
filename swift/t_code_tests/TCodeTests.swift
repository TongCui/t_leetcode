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
}
