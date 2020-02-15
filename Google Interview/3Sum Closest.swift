//
//  3Sum Closest.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/14/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class _Sum_Closest: NSObject {
    class func _threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var minDiff = Int.max
        
        let count = nums.count
        (0..<count).forEach { (firstIndex) in
            (firstIndex+1..<count).forEach { (secondIndex) in
                (secondIndex+1..<count).forEach { (thirdIndex) in
                    
                    let first = nums[nums.index(nums.startIndex, offsetBy: firstIndex)]
                    let second = nums[nums.index(nums.startIndex, offsetBy: secondIndex)]
                    let third = nums[nums.index(nums.startIndex, offsetBy: thirdIndex)]
                    
                    let sum = first + second + third
                    let maxValue = max(target, sum)
                    
                    minDiff = min(maxValue, minDiff)
                }
            }
        }
        
        return minDiff
    }
    
    class func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var minDiff = Int.max
        let sortedNums = nums.sorted()
        
        (0..<nums.count).forEach { (index) in
            var nextIndex = index + 1
            var lastIndex = nums.count - 1
            
            while nextIndex != lastIndex {
                let first = sortedNums[nums.index(sortedNums.startIndex, offsetBy: index)]
                let next = sortedNums[sortedNums.index(sortedNums.startIndex, offsetBy: nextIndex)]
                let last = sortedNums[sortedNums.index(sortedNums.startIndex, offsetBy: lastIndex)]
                
                let sum = first + next + last
                // 0 1 2 3 4 5
                if sum - target == 0 {
                    minDiff = 0
                    nextIndex = lastIndex
                } else if sum > target {
                    minDiff = min(sum - target, minDiff)
                    
                } else if sum < target {
                    minDiff = min(target - sum, minDiff)
                }
            }
        }
        
        return minDiff
    }
    
    class func test() {
        let input = [0,2,1,-3]
        print(threeSumClosest(input, 1))
    }
}
