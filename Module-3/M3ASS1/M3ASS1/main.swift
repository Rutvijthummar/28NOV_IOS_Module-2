//
//  main.swift
//  M3ASS1
//
//  Created by MAC on 29/12/22.
//  WAP to modify value from specific position of an array.

import Foundation

var arr:[Int] = [1,2,3,4,5,6]
var a:Int = 0
var b:Int = 0

print("enter:\n r) remove all ale \n a ) to append value in array \n i) to insert value arry ")

var choice =  readLine()!

switch choice{
    
case "r":arr.removeAll()
    print(arr)
    
case "a":print("Enter the value to be append:")
         a = Int(readLine()!)!
         arr.append(a)
         print(arr)
         break
case "i":print("Enter the value:")
         a = Int(readLine()!)!
         print("Enter the pposition of index")
         b = Int(readLine()!)!
         arr.insert(a, at: b)
         print(arr)
         break
default:print("Invalid")
}

/* var swift_array1:[String] = ["swift1", "swift2", "swift3", "swift4"]

swift_array1[0]="SW-1"

swift_array1[2]="SW-2"

print(swift_array1) */

/*var swift:[Int] = [34,56,53,23,56]

swift[0]=1

swift[2]=3

swift[4]=5

print(swift) */

