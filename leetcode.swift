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


// Leetcode 4 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

var int = 32

class Solution {
        func reverse(_ x: Int) -> Int {
            var x = x
            var reversedX = 0
            while x != 0 {
                reversedX = reversedX * 10 + x % 10
                x /= 10
            }
        return reversedX
    }
}

// LeetCode 5 Given an array nums and a value val, remove all instances of that value in-place and return the new length.

struct RemoveElement {
    func removeElement(arr: inout[Int], val: Int) -> Int {
        arr = arr.filter {$0 != val}
        return arr.count
    }
}

struct RemoveElement2 {
    func removeElement(arr: inout[Int], val: Int) -> Int {
        arr.removeAll {$0 == val}
        return arr.count
    }
}

// LeetCode 6 You are given an array prices where prices[i] is the price of a given stock on the ith day. You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock. Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

struct Profit {
    func count(array: [Int]) -> Int{
       var profit = 0
        for dayOfBuy in 0..<array.count {
            for dayOfSell in dayOfBuy+1..<array.count{
                let differenceOfBuy = array[dayOfSell] - array[dayOfBuy]
                if profit < differenceOfBuy {
                    profit = differenceOfBuy
                }
            }
        }
        return profit
    }
}
