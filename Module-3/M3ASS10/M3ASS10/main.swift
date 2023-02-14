//
//  main.swift
//  M3ASS10
//
//  Created by MAC on 14/02/23.
//  WAP to make a structure to store ten bank account details.

import Foundation

struct BankDetails {
        var CustomerName : String? = "Rutvij"
        
        var BankName : String? = "State Bank Of India"
        
        var BankBranchName : String? = "Khalilpur Road"
        
        var AccountNumber : Int? = 4534564554
        
        var IFSCCode : String = "kha324"
        
        var City : String? = "Junagadh"
        
        var PinCode : Int? = 220022
        
        var AccountType : String? = "Saving"
        
        var DoYouWantPassbook : String? = "Yes"
        
        var FeedBack : String? = "Loan Service Is Not Perfect"
}
var getBank = BankDetails()

print("Branch Name is :",getBank.BankBranchName ?? "")
print("IFSC Code is :",getBank.IFSCCode ?? "")

