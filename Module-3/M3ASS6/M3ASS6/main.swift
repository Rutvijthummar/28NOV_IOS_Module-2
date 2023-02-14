//
//  main.swift
//  M3ASS6
//
//  Created by MAC on 14/02/23.
//  WAP to perform all arithmetic operation using function which
//might be menu driven.

import Foundation

var sum : Int?

func calculate(a : Int, b : Int, c : Arithmetic) {
    switch c {
    case .add :
        sum = a + b
    case .sub :
       sum = a - b
    case .mul :
        sum = a * b
    case .div :
        sum = a / b
    default:
        print("Enter Integer Value only")
    }
}

enum Arithmetic {
    case add
    case sub
    case mul
    case div
}

