//
//  main.swift
//  M3ASS3
//
//  Created by MAC on 02/01/23.
// WAP to check whether a string contains specific characters or not.

import Foundation

// Static

/* let string = "CFG is a CS Portal"

let result1 = string.contains("CS")

print(result1)

let result2 = string.contains("GeeksforGeeks")

print(result2) */

// Input value from user

var name : String = "Rutvij"
print("Enter a character")
var enteredCharacter : String? = readLine()
if name.contains(enteredCharacter ?? "") {
    print("\(enteredCharacter ?? "") character is in Rutvij")
}
else {
    print("Value Not Found ")
}

