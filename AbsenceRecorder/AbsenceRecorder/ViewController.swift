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
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        
        return cell
    }

    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "YEET", size: 10))
        divisions.append(DivisionFactory.createDivision(code: "BrEh", size: 6))
    }

}

