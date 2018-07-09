//
//  ViewController.swift
//  t_code
//
//  Created by tcui on 7/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }
    
    
    func test() {
        let nums1 = [1,3]
        let nums2 = [2]
        
        let solution = MedianOfTwoSortedArrays.Solution().findMedianSortedArrays(nums1, nums2)
        
        print(solution)
        
    }
    
    
}

