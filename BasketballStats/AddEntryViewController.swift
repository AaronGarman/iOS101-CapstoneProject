//
//  AddEntryViewController.swift
//  BasketballStats
//
//  Created by Aaron Garman on 11/12/23.
//

import UIKit

class AddEntryViewController: UIViewController {
    
    
    @IBOutlet weak var shotsMadeInput: UITextField!
    @IBOutlet weak var shotsAttemptedInput: UITextField!
    @IBOutlet weak var shotTypeButton: UIButton!
    @IBOutlet weak var notesInput: UITextView!
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapAddButton(_ sender: Any) {
        var shotsMade = 0
        var shotsAttempted = 0
        var notes = ""
        
        shotsMade = Int(shotsMadeInput.text ?? "0") ?? 0
        shotsAttempted = Int(shotsAttemptedInput.text ?? "1") ?? 1
        notes = notesInput.text ?? ""
        
        //statsEntries.append(Entry(shotsMade: shotsMade, shotsTotal: shotsAttempted, shotsType: "empty", note: notes))
        
        let newEntry = Entry(shotsMade: shotsMade, shotsTotal: shotsAttempted, shotsType: "Freethrows", note: notes)
        //newEntry.addToSavedEntries()
        //print(Entry.getEntries(forKey: Entry.savedEntriesKey))
        
        onAddEntry?(newEntry)
        //onAddStatsEntry?(newEntry)
        dismiss(animated: true)
    }
    
    var onAddEntry: ((Entry) -> Void)? = nil  // for testing reload closure
    //var onAddStatsEntry: ((Entry) -> Void)? = nil // for reload in stats
    
    // to load entries from user defaults
    
    //var statsEntries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shotTypeButton.layer.cornerRadius = 20.0
        shotTypeButton.layer.masksToBounds = true
        //shotTypeButton.layer.borderColor = UIColor.black.cgColor
        //shotTypeButton.layer.borderWidth = 1
        
        //notesInput.layer.borderColor = UIColor.gray.cgColor
        //notesInput.layer.borderWidth = 1
        
        //statsEntries = Entry.getEntries(forKey: Entry.savedEntriesKey)

    }
}
