//
//  Binary Tree Level Order Traversal.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/5/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Binary_Tree_Level_Order_Traversal: NSObject {
  func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    
    var queue: [[TreeNode]] = [[root]]
    var result: [[Int]] = []
    
    while let layer = queue.popLast() {
      result += [layer.map { $0.val }]
      let newLayer = layer.map { [$0.left, $0.right].compactMap { $0 } }.flatMap { $0 }
      if newLayer.isEmpty == false {
        queue += [newLayer]
      }
    }
    
    return result
  }
}
