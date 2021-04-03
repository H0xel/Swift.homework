//
//  leetcode.swift
//  
//
//  Created by Create on 03.04.2021.
//

import Foundation

// Leetcode 1 Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).

func sumArray(array: [Int]) -> [Int]{
    var emptyArray = array
    
    for i in 1..<array.count {
        emptyArray[i] += emptyArray[i - 1]
    }
    return emptyArray
}
sumArray(array: [1,1,1,1,1])
