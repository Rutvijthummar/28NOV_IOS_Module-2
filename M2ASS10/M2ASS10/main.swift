//
//  main.swift
//  M2ASS10
//
//  Created by MAC1 on 28/12/22.
// WAP to find maximum number from four variables using
// conditional (?) operator.

import Foundation

print("enter four different numbers : ")
var a = Int(readLine()!)!
var b = Int(readLine()!)!
var c = Int(readLine()!)!
var d = Int(readLine()!)!

(a>b && a>c && a>d) ? print("a is max") : (b>a && b>c && b>d) ? print("b is max") : (c>a && c>b && c>d) ? print("c is max") : (d>a && d>b && d>c ) ? print("d is max ") : print("all are same ")

