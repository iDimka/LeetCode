//
//  Multiply Strings.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/13/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3013/
 
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

 Example 1:

 Input: num1 = "2", num2 = "3"
 Output: "6"
 Example 2:

 Input: num1 = "123", num2 = "456"
 Output: "56088"
 Note:

 The length of both num1 and num2 is < 110.
 Both num1 and num2 contain only digits 0-9.
 Both num1 and num2 do not contain any leading zero, except the number 0 itself.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 */
class Multiply_Strings: NSObject {
  class Solution {
      /*
      123
      123
      ---
      369
     2460
   012300
    -----
      */
      func multiply(_ num1: String, _ num2: String) -> String {
          let num1 = num1.map (String.init)
          let num2 = num2.map (String.init)
          var result = Array<Int>(repeating: 0, count: num1.count + num2.count)
                  
          
          for (ind1, first) in num2.enumerated().reversed() {
              print("------")
              for (ind2, second) in num1.enumerated().reversed() {
                  let (q, rem) = (second.intValue*first.intValue + result[ind1 + ind2 + 1]).quotientAndRemainder(dividingBy:10)
                  // print("v: \(second.intValue * first.intValue)")
                  result[ind1 + ind2 + 1] = rem
                  result[ind1 + ind2]  = q + result[ind1 + ind2]
                  
                  // print("\(result) \(ind1):\(ind2) \(second.intValue * first.intValue)")
              }
          }
              
          while let leading = result.first, result.count > 1, leading == 0 {
              result = Array(result.dropFirst())
          }
          
          return result.map (String.init).joined(separator: "")
      }
  }
 
  /*
      123
      456
      ---
      738
     615
    492
    -----
    56088
  */
}

extension String {
     var intValue: Int { return Int(self) ?? 0 }
 }
