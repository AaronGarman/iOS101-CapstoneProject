//
//  StatsViewController.swift
//  BasketballStats
//
//  Created by Aaron Garman on 11/5/23.
//

import UIKit

class StatsViewController: UIViewController {
    
    // connecting UI elements
    
    @IBOutlet weak var layupsTitleLabel: UILabel!
    @IBOutlet weak var layupsTotalsLabel: UILabel!
    @IBOutlet weak var layupsPercentLabel: UILabel!
    @IBOutlet weak var freethrowsTitleLabel: UILabel!
    @IBOutlet weak var freethrowsTotalsLabel: UILabel!
    @IBOutlet weak var freethrowsPercentLabel: UILabel!
    @IBOutlet weak var midrangeTitleLabel: UILabel!
    @IBOutlet weak var midrangeTotalsLabel: UILabel!
    @IBOutlet weak var midrangePercentLabel: UILabel!
    @IBOutlet weak var threesTitleLabel: UILabel!
    @IBOutlet weak var threesTotalsLabel: UILabel!
    @IBOutlet weak var threesPercentLabel: UILabel!
    
    // to load entries from user defaults
    
    var statsEntries: [Entry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calcStats()
    }
    
    // so this works to update data, maybe no need closure in original then?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        calcStats()
    }
    
    private func calcStats() {
        //div into more functions?
        
        statsEntries = Entry.getEntries(forKey: Entry.savedEntriesKey)
        
        // math logic for shot totals percent calcs
        
        calcTotals()
        
        // UI formatting
        
        formatLabels(layupsTotalsLabel, layupsPercentLabel)
        formatLabels(freethrowsTotalsLabel, freethrowsPercentLabel)
        formatLabels(midrangeTotalsLabel, midrangePercentLabel)
        formatLabels(threesTotalsLabel, threesPercentLabel)
    }
    
    // gives borders to labels
    
    private func formatLabels(_ totalsLabel: UILabel, _ percentLabel: UILabel) {
        
        totalsLabel.layer.cornerRadius = 20.0
        totalsLabel.layer.masksToBounds = true
        totalsLabel.layer.borderColor = UIColor.black.cgColor
        totalsLabel.layer.borderWidth = 1
        
        percentLabel.layer.cornerRadius = 20.0
        percentLabel.layer.masksToBounds = true
        percentLabel.layer.borderColor = UIColor.black.cgColor
        percentLabel.layer.borderWidth = 1
    }
    
    // calculate shot totals and percentages
    
    private func calcTotals() {
        
        // calculating total made and missed shots
        
        var layupsMade = 0
        var layupsAttempted = 0
        var freethrowsMade = 0
        var freethrowsAttempted = 0
        var midrangeMade = 0
        var midrangeAttempted = 0
        var threesMade = 0
        var threesAttempted = 0
        
        var layupsPercent = 0
        var freethrowsPercent = 0
        var midrangePercent = 0
        var threesPercent = 0
        
        // add total amounts
        
        for entry in statsEntries {
            if (entry.shotsType == "Layups") {
                layupsMade += entry.shotsMade
                layupsAttempted += entry.shotsTotal
            }
            else if (entry.shotsType == "Freethrows") {
                freethrowsMade += entry.shotsMade
                freethrowsAttempted += entry.shotsTotal
            }
            else if (entry.shotsType == "Midrange") {
                midrangeMade += entry.shotsMade
                midrangeAttempted += entry.shotsTotal
            }
            else if (entry.shotsType == "Threes") {
                threesMade += entry.shotsMade
                threesAttempted += entry.shotsTotal
            }
            else {
                continue
            }
        }
        
        // calculate percents
        
        if (layupsAttempted > 0) {
            layupsPercent = Int(Float(layupsMade) / Float(layupsAttempted) * 100)
        }
        else {
            layupsPercent = 0
        }
        
        if (freethrowsAttempted > 0) {
            freethrowsPercent = Int(Float(freethrowsMade) / Float(freethrowsAttempted) * 100)
        }
        else {
            freethrowsPercent = 0
        }
        
        if (midrangeAttempted > 0) {
            midrangePercent = Int(Float(midrangeMade) / Float(midrangeAttempted) * 100)
        }
        else {
            midrangePercent = 0
        }
        
        if (threesAttempted > 0) {
            threesPercent = Int(Float(threesMade) / Float(threesAttempted) * 100)
        }
        else {
            threesPercent = 0
        }
        
        // assign text to labels
        
        layupsTotalsLabel.text = "\(String(layupsMade))/\(String(layupsAttempted))"
        layupsPercentLabel.text = "\(String(layupsPercent))%"
        
        freethrowsTotalsLabel.text = "\(String(freethrowsMade))/\(String(freethrowsAttempted))"
        freethrowsPercentLabel.text = "\(String(freethrowsPercent))%"
        
        midrangeTotalsLabel.text = "\(String(midrangeMade))/\(String(midrangeAttempted))"
        midrangePercentLabel.text = "\(String(midrangePercent))%"
        
        threesTotalsLabel.text = "\(String(threesMade))/\(String(threesAttempted))"
        threesPercentLabel.text = "\(String(threesPercent))%"
        

        // color on percent labels
        
        if (layupsPercent >= 90) {
            layupsTotalsLabel.textColor = .green
        }
        else if (layupsPercent >= 70) {
            layupsPercentLabel.textColor = .systemYellow
        }
        else {
            layupsPercentLabel.textColor = .red
        }
        
        if (freethrowsPercent >= 80) {
            freethrowsPercentLabel.textColor = .green
        }
        else if (freethrowsPercent >= 60) {
            freethrowsPercentLabel.textColor = .systemYellow
        }
        else {
            freethrowsPercentLabel.textColor = .red
        }
        
        if (midrangePercent >= 70) {
            midrangePercentLabel.textColor = .green
        }
        else if (midrangePercent >= 50) {
            midrangePercentLabel.textColor = .systemYellow
        }
        else {
            midrangePercentLabel.textColor = .red
        }
        
        if (threesPercent >= 30) {
            threesPercentLabel.textColor = .green
        }
        else if (threesPercent >= 20) {
            threesPercentLabel.textColor = .systemYellow
        }
        else {
            threesPercentLabel.textColor = .red
        }
    }
}
