//
//  Longest Substring Without Repeating Characters.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/13/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Longest_Substring_Without_Repeating_Characters {
    class func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
      
        var left = 0
        var right = 0
        var maxValue = 0
        var cache: [Character] = []
        let count = s.count
        
        while left < count, right < count {
            let rightIndex = s.index(s.startIndex, offsetBy: right)
            let rightChar = s[rightIndex]
            
            if cache.contains(rightChar) {
                left += 1
                cache.removeAll { $0 == rightChar }
            } else {
                cache += [rightChar]
                right += 1
                maxValue = max(maxValue, right - left)
            }
        }
        
//        maxValue = max(maxValue, right - left)
        return maxValue
    }
    
    class func test() {
        print(lengthOfLongestSubstring("pwwkew"))
    }
}
