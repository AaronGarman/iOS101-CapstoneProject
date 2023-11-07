//
//  ViewController.swift
//  BasketballStats
//
//  Created by Aaron Garman on 11/5/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // protocol functions for Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as! EntryCell
        let entry = entries[indexPath.row]
        
        let percent = Int(Float(entry.shotsMade) / Float(entry.shotsTotal) * 100)
        
        cell.typeLabel.text = entry.shotsType
        cell.shotsLabel.text = String("\(entry.shotsMade)/\(entry.shotsTotal)") // change to use both values
        cell.percentLabel.text = String("\(percent)%") // change to percent and highlight color with ifs
        
        // 2 percent lines fig
        
        // change these based on type
        if (percent >= 70) {
            cell.percentLabel.textColor = .green
        }
        else if (percent >= 50) {
            cell.percentLabel.textColor = .systemYellow
        }
        else {
            cell.percentLabel.textColor = .red
        }
        
        return cell
    }
    
    // UI Outlets
    
    @IBOutlet weak var entriesTableView: UITableView!
    
    // Storing Entry objects
    
    private var entries: [Entry] = []
    
    // Assigning data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entriesTableView.dataSource = self
        
        // will elim this, but just for test values on table view
        entries.append(Entry(shotsMade: 10, shotsTotal: 20, shotsType: "Freethrows", note: "note"))
        entries.append(Entry(shotsMade: 20, shotsTotal: 30, shotsType: "Mid Range", note: "note"))
        entries.append(Entry(shotsMade: 5, shotsTotal: 40, shotsType: "Freethrows", note: "note"))
        entries.append(Entry(shotsMade: 40, shotsTotal: 50, shotsType: "Threes", note: "note"))
        entries.append(Entry(shotsMade: 50, shotsTotal: 60, shotsType: "Freethrows", note: "note"))
        entries.append(Entry(shotsMade: 10, shotsTotal: 20, shotsType: "Freethrows", note: "note"))
        entries.append(Entry(shotsMade: 0, shotsTotal: 30, shotsType: "Mid Range", note: "note"))
        entries.append(Entry(shotsMade: 30, shotsTotal: 40, shotsType: "Freethrows", note: "note"))
        entries.append(Entry(shotsMade: 40, shotsTotal: 50, shotsType: "Threes", note: "note"))
        entries.append(Entry(shotsMade: 10, shotsTotal: 60, shotsType: "Freethrows", note: "note"))
        entries.append(Entry(shotsMade: 10, shotsTotal: 20, shotsType: "Freethrows", note: "note"))
        entries.append(Entry(shotsMade: 20, shotsTotal: 30, shotsType: "Mid Range", note: "note"))
        entries.append(Entry(shotsMade: 30, shotsTotal: 40, shotsType: "Freethrows", note: "note"))
        entries.append(Entry(shotsMade: 40, shotsTotal: 50, shotsType: "Threes", note: "note"))
        entries.append(Entry(shotsMade: 50, shotsTotal: 60, shotsType: "Freethrows", note: "note"))
        
        // self?.entriesTableView.reloadData() -- where fig put this? after entry?
    }
}

// add features like swipe to delete? crud stuff?
// all places n title call this entries or workouts view controller?
// background images any?

