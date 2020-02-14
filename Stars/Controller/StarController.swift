//
//  StarController.swift
//  Stars
//
//  Created by Kendra McVay on 2/13/20.
//  Copyright © 2020 Kendra McVay. All rights reserved.
//

import Foundation

// model controller = source of truth (data)
// usually has 6 main methods on it that help us interact with the model object.
// CRUD = Create, read, uopdate, and delete.
// Save and Load

class StarController {
    // private set means that "Stars" can only be set by the star controller itself.
    private(set) var stars: [Star] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default // singleton, Single Instance that can be used throughout the app
        guard let documents = FileManager.urls(for: .documentsDirectory, in: .userDomainMask).first else { return nil }
        //.first returns the first url that comes back .... ?
        // /Users/johnnyhicks/Documents (just an example of what it might look like when it's trying to access the file
        
        //This return statement is adding a new file, whih is stars.plist.
        
        return documents.appendingPathComponent("stars.plist")
        //appendingPathComponent just creates a new file.
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    //CRUD
    // alows to be felxible whether they care or not ro do anything with this star that they;re reutrnign
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        saveToPersistentStore()
        return star
    }
    
    
    func listStars() -> String {
               var output = ""
               for star in stars {
                   output += "\(star.name) is \(star.distanceDescription)."
               
               }
           return output
    }
    
    func saveToPersistentStore() {
        // Star -> Data -> Plist
        
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error).")
        }
        
    }
    func loadFromPersistentStore() {
        // going from Plist, plling from the data, and decode it into star objects
    // Plist -> Data - > Stars
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {
            return }
     
        do {
            let data = try Data(contentsOf: url) // pull the data out of this url
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("error loading stars data: \(error)")
        }
        
    }
}

