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
        
        // calc shot percentage

        let percent = Int(Float(entry.shotsMade) / Float(entry.shotsTotal) * 100)
        
        // initialize UI elements
        
        cell.typeLabel.text = entry.shotsType
        cell.shotsLabel.text = String("\(entry.shotsMade)/\(entry.shotsTotal)")
        cell.percentLabel.text = String("\(percent)%")
        
        formatColors(percent, cell)
        
        return cell
    }
    
    // for cell deletion
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            entries.remove(at: indexPath.row)
            Entry.save(entries, forKey: Entry.savedEntriesKey)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // Connect UI elements
    
    @IBOutlet weak var entriesTableView: UITableView!
    
    
    @IBAction func didTapAddButton(_ sender: Any) {     // need?
        performSegue(withIdentifier: "AddSegue", sender: nil)
    }
    
    // Storing Entry objects
    
    private var entries: [Entry] = []
    
    // Assigning data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entries = Entry.getEntries(forKey: Entry.savedEntriesKey)   // this or diff?
        
        entriesTableView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if (entries.isEmpty) {
            loadTestEntries() // do load from table instead once set
        }
        
        entriesTableView.reloadData() //-- where fig put this? after entry?
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = entriesTableView.indexPathForSelectedRow {
            entriesTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    // load test entries into table view
    
    func loadTestEntries() {
        entries.append(Entry(shotsMade: 18, shotsTotal: 20, shotsType: "Freethrows", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 20, shotsTotal: 30, shotsType: "Midrange", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 5, shotsTotal: 40, shotsType: "Freethrows", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 40, shotsTotal: 50, shotsType: "Threes", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 40, shotsTotal: 60, shotsType: "Layups", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 17, shotsTotal: 20, shotsType: "Freethrows", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 25, shotsTotal: 30, shotsType: "Midrange", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 30, shotsTotal: 40, shotsType: "Freethrows", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 40, shotsTotal: 50, shotsType: "Threes", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 10, shotsTotal: 60, shotsType: "Freethrows", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 50, shotsTotal: 50, shotsType: "Layups", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 20, shotsTotal: 30, shotsType: "Midrange", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 30, shotsTotal: 40, shotsType: "Freethrows", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 40, shotsTotal: 50, shotsType: "Threes", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 50, shotsTotal: 60, shotsType: "Freethrows", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        entries.append(Entry(shotsMade: 50, shotsTotal: 75, shotsType: "Layups", note: "Good workout, next time focus on form and follow through. Try to score a higher percentage during next session."))
        
        for entry in entries {
            entry.addToSavedEntries()
        }
    }
    
    // format color of percent label
    
    func formatColors(_ inputPercent: Int, _ inputCell: EntryCell) {
        if (inputCell.typeLabel.text == "Layups") {
            if (inputPercent >= 90) {
                inputCell.percentLabel.textColor = .green
            }
            else if (inputPercent >= 70) {
                inputCell.percentLabel.textColor = .systemYellow
            }
            else {
                inputCell.percentLabel.textColor = .red
            }
        }
        else if (inputCell.typeLabel.text == "Freethrows") {
            if (inputPercent >= 80) {
                inputCell.percentLabel.textColor = .green
            }
            else if (inputPercent >= 60) {
                inputCell.percentLabel.textColor = .systemYellow
            }
            else {
                inputCell.percentLabel.textColor = .red
            }
        }
        else if (inputCell.typeLabel.text == "Midrange") {
            if (inputPercent >= 70) {
                inputCell.percentLabel.textColor = .green
            }
            else if (inputPercent >= 50) {
                inputCell.percentLabel.textColor = .systemYellow  // change back*** or change rest if background
            }
            else {
                inputCell.percentLabel.textColor = .red
            }
        }
        else if (inputCell.typeLabel.text == "Threes") {
            if (inputPercent >= 30) {
                inputCell.percentLabel.textColor = .green
            }
            else if (inputPercent >= 20) {
                inputCell.percentLabel.textColor = .systemYellow
            }
            else {
                inputCell.percentLabel.textColor = .red
            }
        }
    }
    
    // segue to detail view controller from main view controller of entries
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "DetailSegue") {
            guard let selectedIndexPath = entriesTableView.indexPathForSelectedRow else { return }
            let selectedEntry = entries[selectedIndexPath.row]
            guard let detailViewController = segue.destination as? DetailViewController else { return }
            detailViewController.entry = selectedEntry
        }
        else if (segue.identifier == "AddSegue") {
            if let addEntryNavController = segue.destination as? UINavigationController,
               let addEntryViewController = addEntryNavController.topViewController as? AddEntryViewController {
                addEntryViewController.onAddEntry = { [weak self] entry in
                    entry.addToSavedEntries()
                    self?.entries = Entry.getEntries(forKey: Entry.savedEntriesKey)
                    //self?.entriesTableView.reloadData()
                    self?.entriesTableView.reloadSections(IndexSet(integer: 0), with: .automatic)
                }
            }
        }
        else {
            
        }
    }
}
