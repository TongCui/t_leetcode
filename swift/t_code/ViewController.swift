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
        let a = [[1], [1]]
        let b = [[2], [2], [2]]
        
        zip(a, b).forEach { (left, right) in
            print(left)
            print(right)
        }
    }
    
    
}

