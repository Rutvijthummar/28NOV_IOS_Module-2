//
//  DMLOperations.swift
//  CrudOperation
//
//  Created by MAC on 03/03/23.
//

import Foundation
import UIKit
import SQLite3

class DMLOperations: NSObject {
    
    var strPath = ""
    
    func dmlservices(query:String)->Bool {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        strPath = path+"/rutvij_db.db"
        
        var status = false
        var statement:OpaquePointer?=nil
        
        if sqlite3_open(strPath, &statement)==SQLITE_OK
        {
            if sqlite3_prepare_v2(statement, query, -1, &statement, nil)==SQLITE_OK
            {
                status = true
                sqlite3_step(statement)
            }
            sqlite3_finalize(statement)
            sqlite3_close(statement)
        }
        return status
        
    }
    
    func loginUser(query:String)->Array<Any> {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        strPath = path+"/rutvij_db.db"
        
        var data = Array<Any>()
        var statement:OpaquePointer?=nil
        
        if sqlite3_open(strPath, &statement)==SQLITE_OK
        {
            if sqlite3_prepare_v2(statement, query, -1, &statement, nil)==SQLITE_OK
            {
                while sqlite3_step(statement)==SQLITE_ROW
                {
                    let unm = String.init(cString: sqlite3_column_text(statement, 3))
                    let pas = String.init(cString: sqlite3_column_text(statement, 4))
                    data.append(unm)
                    data.append(pas)
                }
            }
            
            sqlite3_finalize(statement)
            sqlite3_close(statement)
            
        }
        
        return data
        
    }
    
    func showData(query:String)->Array<Any> {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        strPath = path+"/rutvij_db.db"
        
        var data = Array<Any>()
        var dict = Dictionary<String,Any>()
        var statement:OpaquePointer?=nil
        
        if sqlite3_open(strPath, &statement)==SQLITE_OK
        {
            if sqlite3_prepare_v2(statement, query, -1, &statement, nil)==SQLITE_OK
            {
                while sqlite3_step(statement)==SQLITE_ROW
                {
                    let name = String.init(cString: sqlite3_column_text(statement, 1))
                    let city = String.init(cString: sqlite3_column_text(statement, 2))
                    let email = String.init(cString: sqlite3_column_text(statement, 3))
                    let mobile = String.init(cString: sqlite3_column_text(statement, 4))
                    
                    dict["fullname"]=name
                    dict["city"]=city
                    dict["email"]=email
                    dict["mobile"]=mobile
                    
                    data.append(dict)
                }
            }
            
            sqlite3_finalize(statement)
            sqlite3_close(statement)
        }
        
        return data
        
    }
    
}
