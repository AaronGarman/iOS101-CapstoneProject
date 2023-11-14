//
//  Entry.swift
//  BasketballStats
//
//  Created by Aaron Garman on 11/5/23.
//

import Foundation

struct Entry: Codable, Equatable {
    let shotsMade: Int
    let shotsTotal: Int
    let shotsType: String
    let note: String
}

extension Entry {
    
    // save to user defaults

    static var savedEntriesKey: String {
        return "savedEntries"
    }

    static func save(_ entries: [Entry], forKey key: String) {
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(entries)
        defaults.set(encodedData, forKey: key)
    }

    static func getEntries(forKey key: String) -> [Entry] {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: key) {
            let decodedEntries = try! JSONDecoder().decode([Entry].self, from: data)
            
            return decodedEntries
            
        } else {
            return []
        }
    }
    
    func addToSavedEntries() {
        var savedEntries = Entry.getEntries(forKey: Entry.savedEntriesKey)
        savedEntries.append(self)
        Entry.save(savedEntries, forKey: Entry.savedEntriesKey)
    }

    func removeFromSavedEntries() {
        var savedEntries = Entry.getEntries(forKey: Entry.savedEntriesKey)
        savedEntries.removeAll { entry in
            return self == entry
        }
        Entry.save(savedEntries, forKey: Entry.savedEntriesKey)
    }
}
