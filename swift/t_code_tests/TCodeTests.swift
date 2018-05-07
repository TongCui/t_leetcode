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
}
