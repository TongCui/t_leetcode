//
//  MaximumDepthOfBinaryTree.swift
//  t_code
//
//  Created by tcui on 10/5/2018.
//  Copyright © 2018 LuckyTR. All rights reserved.
//

import Foundation

class MaximumDepthOfBinaryTree {
    
    class Solution {
        func maxDepth(_ root: TreeNode?) -> Int {
            if let root = root {
                return 1 + max(maxDepth(root.left), maxDepth(root.right))
            } else {
                return 0
            }
        }
    }

}
