//
//  main.swift
//  M3ASS9
//
//  Created by MAC on 14/02/23.
//  WAP to make three same function within two diff class using
//method overriding.

import Foundation

class FirstMatch {
    func Virat() {
        print("Virat Has a very good cover  drive shot")
    }
    
    func two() {
        print("Rohit Has a very good pull shot .")
    }
    
    func three() {
        print("Surya has a very good pick up shot .")
    }
}

class SecondDemo : FirstMatch{
        func oneSecond() {
        print("Bhuvi is a very good swinger bowler")
    }
    
    override func two() {
        print("Bumrah is a very good death over specialist bowler.")
    }
    
    override func three() {
        print("Umran is a very good fast bowler.")
    }
 
}
func show() {
    FirstMatch().Virat()
    SecondDemo().Virat()
    SecondDemo().oneSecond()
    SecondDemo().two()
}
show()

