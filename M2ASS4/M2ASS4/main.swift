//
//  main.swift
//  M2ASS4
//
//  Created by MAC1 on 28/12/22.
// WAP to find maximum value from three numbers.

import Foundation

print("Enter the First number")
var num1 = Int(readLine()!)!
print(num1)

print("Enter the Second number")
var num2 = Int(readLine()!)!
print(num2)

print("Enter the Third number")
var num3 = Int(readLine()!)!
print(num3)

var largestnum = max(num1, num2, num3)
print("largestnum is",largestnum)

