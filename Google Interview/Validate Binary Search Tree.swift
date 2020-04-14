//
//  Validate Binary Search Tree.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/13/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Validate_Binary_Search_Tree: NSObject {
  /// Doesn't work properly
  func isValidBSTRecursive(_ root: TreeNode?, min: inout [Int], max: inout [Int]) -> Bool {
    guard let root = root else { return true }
    
    if root.left?.val ?? Int.min >= root.val {
      return false
    }
    if root.right?.val ?? Int.max <= root.val {
      return false
    }
    
    if let left = root.left, let min = min.last, min <= left.val {
      return false
    }
    if let right = root.right, let max = max.last, max >= right.val {
      return false
    }
    
    if let left = root.left?.val {
      min.append(left)
    }
    if let right = root.right?.val {
      max.append(right)
    }
    
    return
      isValidBSTRecursive(root.left, min: &min, max: &max)
        &&
        isValidBSTRecursive(root.right, min: &min, max: &max)
  }
  
  func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    
    var stack: [TreeNode] = []
    var node: TreeNode? = root
    var compareValue = Int.min
    
    while node != nil || stack.isEmpty == false {
      while let n = node {
        stack.append(n)
        node = n.left
      }
      
      guard stack.isEmpty == false else {
        return false //???
      }
      
      let n = stack.removeLast()
      
      guard n.val > compareValue else {
        return false
      }
      compareValue = n.val
      node = n.right
    }
    return true
  }
  
  class func test() {
    let input: [Int?] = [2,1,3]
    let tree = input.tree()
    print(tree ?? "")
    
    print(Validate_Binary_Search_Tree().isValidBST(tree))
  }
}

extension Array where Element == Int? {
  func tree(from index: Int = 0) -> TreeNode? {
    guard isEmpty == false else { return nil }
    guard index < count else { return nil }
    guard let value = self[index] else { return nil }
    
    return TreeNode(value,
                    left: tree(from: index * 2 + 1),
                    right: tree(from: index * 2 + 2))
    
  }
}
