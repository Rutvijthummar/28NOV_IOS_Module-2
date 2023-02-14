//
//  main.swift
//  M3ASS5
//
//  Created by MAC on 14/02/23.
// WAP to sort an array element using closure

import Foundation

var numbers = [10, 5, 7, 8, 2, 4, 1, 3]

//numbers.sort { $0 < $1 }
let aNum = numbers.sorted(by: <)
print(aNum)

let dNum = numbers.sorted(by : >)
print(dNum)

