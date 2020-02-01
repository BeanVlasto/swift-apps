//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Vlasto, Benedict (JDN) on 28/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addDummyData()
        for eachDivision in divisions {
            print("Code: \(eachDivision.code), Size: \(eachDivision.students.count)")
            for eachStudent in eachDivision.students {
                print(eachStudent.forename)
            }
        }
        
        updateDateDisplay()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        cell.textLabel?.text = divisions[indexPath.row].code
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc  = storyboard?.instantiateViewController(withIdentifier: "DivisionAbsenceViewController") as? DivisionAbsenceViewController else {
            fatalError("Failed to load Division Absence View Controller from Storyboard.")
        }
        
        vc.division = divisions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        navigationItem.title = formatter.string(from: currentDate)
    }

    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "YEET", size: 10))
        divisions.append(DivisionFactory.createDivision(code: "BrEh", size: 6))
    }
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
}

