//
//  main.swift
//  M3ASS8
//
//  Created by MAC on 14/02/23.
// WAP to make an employee class which properties should
//access through manager class.

import Foundation

class IosEmployee {
    var Raj : String?
    var RajSalary : Int?
    
    var Jhangir : String?
    var JhangirSalary : Int?
    
    func show() {
        print("Number 1 Employee Name :")
        print("Number 2 Employee Name :")
        
        print("Number 1 Employee Salary :")
        print("Number 2 Employee Salary :")
    }
}

class Manager : IosEmployee {
    func getFunc() {
        print("Enter Your Name Please")
        var getName = readLine()
        Raj = getName
        
        print("Enter Your Name Please")
        var getName2 = readLine()
        Jhangir = getName2
        
        print("Enter Your Salary Please")
        var getSalary1 = Int(readLine()!)!
        RajSalary = (getSalary1)
        
        print("Enter Your Salary Please")
        var getSalary2 = Int(readLine()!)!
        JhangirSalary = getSalary2
    }
}
var Dept = Manager()
Dept.getFunc()

Dept.show()
    print(Dept.Raj ?? "")
    print(Dept.Jhangir ?? "")
    print(Dept.RajSalary ?? "")
    print(Dept.JhangirSalary ?? "")

