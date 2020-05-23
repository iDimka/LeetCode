//
//  Longest Palindromic Substring.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/23/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
/**
 https://leetcode.com/explore/interview/card/facebook/55/dynamic-programming-3/3034/
 
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example 1:
 
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 Example 2:
 
 Input: "cbbd"
 Output: "bb"
 Hide Hint #1
 How can we reuse a previously computed palindrome to compute a larger palindrome?
 Hide Hint #2
 If “aba” is a palindrome, is “xabax” and palindrome? Similarly is “xabay” a palindrome?
 Hide Hint #3
 Complexity based hint:
 If we use brute-force and check whether for every start and end position a substring is a palindrome we have O(n^2) start - end pairs and O(n) palindromic checks. Can we reduce the time for palindromic checks to O(1) by reusing some previous computation.
 */
class Longest_Palindromic_Substring: NSObject {
  func longestPalindrome(_ s: String) -> String {
    var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
    var max = Int.min
    var result = ""
    
    for ind in 0..<s.count {
      dp[ind][ind] = 1
    }
    
    dp.printMatrix()
    
    for ind in 0..<s.count - 1 {
      let startString = s[s.index(s.startIndex, offsetBy: ind)]
      let endString = s[s.index(s.startIndex, offsetBy: ind + 1)]
      
      dp[ind][ind + 1] = startString == endString ? 2 : 1
      if dp[ind][ind + 1] > max {
        max = Swift.max(max, dp[ind][ind + 1])
        result = String(s[s.index(s.startIndex, offsetBy: ind)...s.index(s.startIndex, offsetBy: ind+1)])
      }
    }
    
    dp.printMatrix()
    
    for index in 3...s.count {
      for start in 0..<s.count - index + 1 {
        let end = start + index - 1
        let startString = s[s.index(s.startIndex, offsetBy: start)]
        let endString = s[s.index(s.startIndex, offsetBy: end)]
        
        if startString == endString {
          dp[start][end] = dp[start + 1][end - 1] + 2
          if dp[start][end] > max {
            max = Swift.max(max, dp[start][end])
            result = String(s[s.index(s.startIndex, offsetBy: start)...s.index(s.startIndex, offsetBy: end)])
          }
        } else {
          dp[start][end] = Swift.max(dp[start + 1][end], dp[start][end - 1])
        }
        print("\(start)-\(end) "+startString.string+endString.string)
        dp.printMatrix()
      }
    }
    
    print(dp[0][s.count - 1])
    
    
    return result.count > 0 ? result : s[s.startIndex].string
  }
  
  class func test() {
    let solution = Longest_Palindromic_Substring()
    print(solution.longestPalindrome("ababa"))
  }
}

extension Array {
  func printMatrix() {
    //    guard first is Array else { print("not 2d"); return }
    
    for arr in self {
      guard let arr = arr as? [Int] else { return }
      
      print(arr, separator: "", terminator: "\n")
    }
  }
}
