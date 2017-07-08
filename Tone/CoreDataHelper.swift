//
//  CoreDataHelper.swift
//  Tone
//
//  Created by Fernando on 7/8/17.
//  Copyright © 2017 Christopher Aziz. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    static let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func createEntry() -> Entry {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Entry", into: managedContext) as! Entry
        
        return note
    }
    
    static func saveEntry() {
        do {
            try managedContext.save()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    static func deleteEntry(note: Entry) {
        managedContext.delete(note)
        saveEntry()
    }
    
    static func retrieveAllEntries() -> [Entry] {
        let fetchRequest = NSFetchRequest<Entry>(entityName: "Entry")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let err as NSError {
            print("Couldn't fetch all notes \(err)")
        }
        
        return []
        
    }
}
