//
//  main.swift
//  M3ASS4
//
//  Created by MAC on 02/01/23.
// WAP to swap of two number using in-out parameters within
//function.

import Foundation

// Static

/* var a = 10
var b = 5
print("Before swapping: a = \(a), b = \(b)")
(a,b) = (b,a)
print("After swapping: a \(a), b = \(b)") */

// Input value from user

print("Enter A:")
var a=Int(readLine()!)!
print("Enter b:")
var b=Int(readLine()!)!

func swapNum(_ a : inout Int, _ b : inout Int)
{
    let tempA = a
    a = b
    b = tempA
    print("a is ",a)
    print("b is ",b)


}
swapNum(&a, &b)

