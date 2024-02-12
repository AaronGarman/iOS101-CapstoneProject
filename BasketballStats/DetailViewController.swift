//
//  DetailViewController.swift
//  BasketballStats
//
//  Created by Aaron Garman on 11/9/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    // connect UI elements
    
    @IBOutlet weak var shotsTypeLabel: UILabel!
    @IBOutlet weak var shotsMadeLabel: UILabel!
    @IBOutlet weak var shotsAttemptedLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var NoteLabel: UITextView!
    
    // entry used for detail view
    
    var entry: Entry!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        // calc shot percentage to display
        
        let percent = Int(Float(entry.shotsMade) / Float(entry.shotsTotal) * 100)
        
        // initialize UI elements
        
        shotsTypeLabel.text = entry.shotsType
        shotsMadeLabel.text = String(entry.shotsMade)
        shotsAttemptedLabel.text = String(entry.shotsTotal)
        percentLabel.text = String("\(percent)%")
        NoteLabel.text = entry.note
        
        formatLabel(shotsMadeLabel)
        formatLabel(shotsAttemptedLabel)
        
        formatColors(percent)
    }
    
    // adds borders to labels
    
    private func formatLabel(_ inputLabel: UILabel) {
        inputLabel.layer.cornerRadius = 20.0
        inputLabel.layer.masksToBounds = true
        inputLabel.layer.borderColor = UIColor.black.cgColor
        inputLabel.layer.borderWidth = 1
    }
    
    // sets percent color
    
    private func formatColors(_ inputPercent: Int) {
        if (shotsTypeLabel.text == "Layups") {
            if (inputPercent >= 90) {
                percentLabel.textColor = .green
            }
            else if (inputPercent >= 70) {
                percentLabel.textColor = .systemYellow
            }
            else {
                percentLabel.textColor = .red
            }
        }
        else if (shotsTypeLabel.text == "Freethrows") {
            if (inputPercent >= 80) {
                percentLabel.textColor = .green
            }
            else if (inputPercent >= 60) {
                percentLabel.textColor = .systemYellow
            }
            else {
                percentLabel.textColor = .red
            }
        }
        else if (shotsTypeLabel.text == "Midrange") {
            if (inputPercent >= 70) {
                percentLabel.textColor = .green
            }
            else if (inputPercent >= 50) {
                percentLabel.textColor = .systemYellow
            }
            else {
                percentLabel.textColor = .red
            }
        }
        else if (shotsTypeLabel.text == "Threes") {
            if (inputPercent >= 30) {
                percentLabel.textColor = .green
            }
            else if (inputPercent >= 20) {
                percentLabel.textColor = .systemYellow
            }
            else {
                percentLabel.textColor = .red
            }
        }
    }
}
