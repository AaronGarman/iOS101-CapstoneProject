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
        var shotsType = ""
        var notes = ""
        
        shotsMade = Int(shotsMadeInput.text ?? "0") ?? 0
        shotsAttempted = Int(shotsAttemptedInput.text ?? "1") ?? 1
        shotsType = shotTypeButton.titleLabel?.text ?? "none"
        notes = notesInput.text ?? ""
        
        let newEntry = Entry(shotsMade: shotsMade, shotsTotal: shotsAttempted, shotsType: shotsType, note: notes)
        
        onAddEntry?(newEntry)
        dismiss(animated: true)
    }
    
    var onAddEntry: ((Entry) -> Void)? = nil
    
    var buttonElements: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shotTypeButton.layer.cornerRadius = 20.0
        shotTypeButton.layer.masksToBounds = true
        
        buttonElements.append("Layups")
        buttonElements.append("Freethrows")
        buttonElements.append("Midrange")
        buttonElements.append("Threes")
        
        popUpButtonInit()

    }
    
    private func popUpButtonInit() {
        let optionClosure = {(action: UIAction) in
                    print(action.title)
                }

        var optionsArray = [UIAction]()

        for element in buttonElements {
            let action = UIAction(title: element, state: .off, handler: optionClosure)
            optionsArray.append(action)
        }
                
        optionsArray[0].state = .on
        let optionsMenu = UIMenu(title: "", options: .displayInline, children: optionsArray)
                
        shotTypeButton.menu = optionsMenu

        shotTypeButton.changesSelectionAsPrimaryAction = true
        shotTypeButton.showsMenuAsPrimaryAction = true
        
    }
}
