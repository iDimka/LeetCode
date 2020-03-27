//
//  Letter Combinations of a Phone Number.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/19/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Letter_Combinations_of_a_Phone_Number: NSObject {
    let mapping: [Character: String] = [
        "2": "ABC",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"]
    
    var output: String = ""
    
    func permutate(_ input: String, _ letters: [String]) {
        guard letters.isEmpty == false else { return }
        
        for letter: Character in letters.first! {
            output += letter.string
            print("letter: \(letter) out: \(output) letters: \(letters.joined(separator: " "))")
            permutate(output, letters.dropFirst().array)
        }
    }
    
    func letterCombinations(_ digits: String) -> String {
        let stringsArray = digits.compactMap { mapping[$0] }
        permutate("", stringsArray)
        
        return output
    }
    
    class func test() {
        let input = "23"
        
        print(Letter_Combinations_of_a_Phone_Number().letterCombinations(input))
    }
}

extension DropFirstSequence {
    var array: [Element] { Array(self) }
}

extension Character {
    var string: String { "\(self)" }
}
