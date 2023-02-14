//
//  main.swift
//  M3ASS13
//
//  Created by MAC on 14/02/23.
//  WAP to use generics to swap two integer values.

import Foundation

func swap<D>(left : inout D, right : inout D) {
    let data = left
    left = right
    right = data
}

var a = 0
var b = 1
swap(left: &a, right: &b)
print("x is now = ",a)
print("y is now =",b)

