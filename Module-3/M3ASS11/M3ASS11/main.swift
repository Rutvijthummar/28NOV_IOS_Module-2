//
//  main.swift
//  M3ASS11
//
//  Created by MAC on 14/02/23.
//  WAP to make a protocol for variables which should be used in
//class.

import Foundation

class User {
    var uData : info?
    func printname() {
        uData?.getName(name: "Rutvij", dept:  "IOS")
    }
}
class displayData : info {

    func getName(name: String, dept: String) {
        print("My name is", name)
        print("Depatement is", dept)
    }
    func setDelegate() {
        let userob = User()
        userob.uData = self
        userob.printname()
    }
  
}

protocol info {
    func getName(name : String, dept : String)
    }

displayData().setDelegate()

