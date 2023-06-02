//
//  DMLOperation.swift
//  CoreDataPractice
//
//  Created by MAC on 22/03/23.
//

import Foundation
import UIKit
import CoreData

class DMLOperation
{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func savedata(data:[String:Any])
    {
        
        let insert_data = NSEntityDescription.insertNewObject(forEntityName: "Studinfo", into: context) as! Studinfo
        insert_data.name = data["name"] as? String
        insert_data.subject = data["subject"] as? String
        insert_data.email = data["email"] as? String
        insert_data.mobile = Int64(data["mobile"] as! Int)
        
    }
    
    func showdata() -> [Studinfo]
    {
        
        var stdata = [Studinfo]()
        let req = NSFetchRequest<NSManagedObject>.init(entityName: "Studinfo")
        
        do
        {
            stdata = try context.fetch(req) as! [Studinfo]
        }
        catch
        {
            print(error.localizedDescription)
        }
        
        return stdata
        
    }
    
    func datadelete(index:Int)->[Studinfo]
    {
        var stdata=showdata()
        context.delete(stdata[index])
        stdata.remove(at: index)
        
        do
        {
            try context.save()
        }
        catch
        {
            print(error.localizedDescription)
        }
        return stdata
    }
    
}
