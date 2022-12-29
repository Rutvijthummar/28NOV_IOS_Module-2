//
//  main.swift
//  M2ASS8
//
//  Created by MAC1 on 28/12/22.
// WAP to perform all arithmetic operation with menu driven.

import Foundation

print("enter the 1st number : ")
var a = Int(readLine()!)!

print("enter the 2nd number : ")
var b = Int(readLine()!)!

print("\n-------- MENU --------\n press + for addition\n press - for subtraction\n press * for multiplication\n press / for division")
var ch = readLine()!

switch ch
{
case "+" :
    print("addition : \(a+b)")
    break;
case "-" :
    print("subtraction : \(a-b)")
    break
case "*" :
    print("multiplication : \(a*b)")
    break
case "/" :
    print("division : \(a/b)")
    break
default:
    print("INVALID CHOICE")
}

