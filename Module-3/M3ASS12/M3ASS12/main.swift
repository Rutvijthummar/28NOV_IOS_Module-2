//
//  main.swift
//  M3ASS12
//
//  Created by MAC on 14/02/23.
//  WAP to make a protocol with optional and required methods
//and use within a class.

import Foundation

class nameClass {
    var getData : UseProtocol?
    func getdetails() {
        getData?.nameRequired(name: "DHarmesh")
        getData?.deptRequired(Departement: "IOS")
        getData?.genderOptional?(gender: "Male")
    }
    
}

class myData : UseProtocol {
    func nameRequired(name: String) {
        print("Hii", name)
    }
    
    func deptRequired(Departement : String) {
        print("Your id is", Departement)
    }
    
    func forDelegate() {
        let obj = nameClass()
        obj.getData  = self
        obj.getdetails()
    }
    
}
@objc protocol UseProtocol {
    func nameRequired(name : String)
    func deptRequired(Departement : String)
    @objc optional func genderOptional(gender : String)
}

myData().forDelegate()

