//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Vlasto, Benedict (JDN) on 28/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var divisions: [Division] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addDummyData()
        for eachDivision in divisions {
            print(eachDivision.code)
            print(eachDivision.size)
            for eachStudent in eachDivision.students {
                print(eachStudent.forename)
            }
        }
    }

    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "YEET", size: 10))
        divisions.append(DivisionFactory.createDivision(code: "BrEh", size: 6))
    }

}

