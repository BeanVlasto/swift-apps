//
//  StudentFactory.swift
//  AbsenceRecorder
//
//  Created by Vlasto, Benedict (JDN) on 28/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class StudentFactory {
    static func createStudents(size: Int) -> [Student] {
        var arrayOfStudents: [Student] = []
        let arrayOfNames = ["Charlie", "Johnny", "Fergus", "Grace", "Lola", "Alex", "Petra", "Catherine", "Freddy", "Tom", "Susan", "Boyle"]
        for _ in 1 ... size {
            let nameSelector = Int.random(in: 0 ..< arrayOfNames.count)
            let randomName = arrayOfNames[nameSelector]
            arrayOfStudents.append(Student(forename: randomName, surname: "Vlasto", birthday: Date()))
        }
        return arrayOfStudents
    }
}
