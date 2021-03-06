//
//  DivisionAbsenceViewController.swift
//  AbsenceRecorder
//
//  Created by Vlasto, Benedict (JDN) on 01/02/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class DivisionAbsenceViewController: UITableViewController {
    
    var division: Division
    var absence: Absence
    
    init?(coder: NSCoder, division: Division, absence: Absence) {
        self.division = division
        self.absence = absence
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this Controller with a Division and Absence")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = division.code
        //Here, ONLY add each student to the present list if an absence doesn't already exist for that division on that date.
        //This isn't quite right, but it works, assuming at least one student is present in each existing absence (a fair assumption).
        if absence.present == [] {
            for eachStudent in division.students {
                absence.present.append(eachStudent)
            }
        }
        selectRowsForPresentStudents()
    }
    
    func selectRowsForPresentStudents() {
        for (position, student) in division.students.enumerated() {
            if absence.present.contains(student) {
                let indexPath = IndexPath(row: position, section: 0)
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division.students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = division.students[indexPath.row].forename
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStudent = division.students[indexPath.row]
        absence.present.append(selectedStudent)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedStudent = division.students[indexPath.row]
        absence.present.removeAll {
            $0 == selectedStudent
        }
    }

}
