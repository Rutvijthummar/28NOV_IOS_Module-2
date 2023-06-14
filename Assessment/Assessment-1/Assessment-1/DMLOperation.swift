//
//  DMLOperation.swift
//  Assessment-1
//
//  Created by MAC on 13/06/23.
//

import Foundation
import UIKit
import SQLite3

class DMLoperation: NSObject {
    
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
    
}
