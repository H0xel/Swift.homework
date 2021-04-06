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

// Leetcode 2 Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn]. Return the array in the form [x1,y1,x2,y2,...,xn,yn].

func array1(array: [Int]) -> [Int]{
    
    var emptyArray = [Int]()
    let halfArray = array.count / 2
    
    for i in 0..<halfArray {
        emptyArray.append(array[0 + i])
        emptyArray.append(array[i + halfArray])
        
    }
    return emptyArray
}
