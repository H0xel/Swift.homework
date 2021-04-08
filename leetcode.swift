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

// Leetcode 3 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice. You can return the answer in any order.

func array(array: [Int], target: Int) -> [Int] {
    var emptyArray = [Int]()
    
    for i in 0..<array.count {
        for b in array {
            if target == array[i] + b, array[i] != b {
                emptyArray.append(i)
                }
            }
        }
    return emptyArray
}
