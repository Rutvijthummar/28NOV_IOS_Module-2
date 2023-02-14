//
//  main.swift
//  M3ASS2
//
//  Created by MAC on 14/02/23.
// WAP to take two key like. Colors, digits and value should be
//an array then get that specific value from array.

import Foundation

var mainDict = [
    
        "city" : ["Junagadh", "Rajkot", "Ahmedabad", "Surat", "Baroda", ["Bhavnagar","Amreli"]],
        "digits" : ["1", "2", "3", "4", "5"]

]

print(mainDict["city"] ?? "")
print(mainDict["city"]?[1] ?? "")
print(mainDict["city"]?[5] ?? "")

