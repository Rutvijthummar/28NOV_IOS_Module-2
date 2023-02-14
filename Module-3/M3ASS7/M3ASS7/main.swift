//
//  main.swift
//  M3ASS7
//
//  Created by MAC on 14/02/23.
// WAP to make class of bank account of person which should
//perform all banking operation using functions.

import Foundation

class Bank_Account
{
    var customer_id : Int?
    var customer_name : String?
    var customer_accountBalance : Int?
    var customer_interest : Int?
    var customer_charges : Int?
    var customer_withdrawl : Int?
    var val1:Int?
    var val2 : Int?
    
    func calculateBalance () {
     
        val1 = (customer_accountBalance ?? 0) + (customer_interest ?? 0)
        print("Total balance of customer with interest",val1)
        
        val2 = (val1 ?? 0) - (customer_withdrawl ?? 0) - (customer_charges ?? 0)
        print("Net total balance of customer after minus charges and withdrawl =" , val2)
    }
    
}

var total = Bank_Account()
total.customer_accountBalance = 400000
total.customer_interest = 20000
total.customer_withdrawl = 150000
total.customer_charges = 7000

total.calculateBalance()

