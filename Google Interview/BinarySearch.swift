//
//  BinarySearch.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/29/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class BinarySearch: NSObject {
    class func findIndex<T: Comparable>(of x: T, in array: [T]) -> Int {
        var left = 0
        var right = array.count - 1
        
        while right >= left {
            let guess = left + (right - left) / 2
            
            if array[guess] > x {
                right = guess - 1
            } else if array[guess] < x {
                left = guess + 1
            } else {
                return guess
            }
        }
        return -1
    }
    
    class func test() {
        let input = [0, 1, 2, 3, 4, 5, 6]
        
        print(BinarySearch.findIndex(of: 3, in: input))
    }
}
