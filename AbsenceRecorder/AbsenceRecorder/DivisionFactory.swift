//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by Vlasto, Benedict (JDN) on 28/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class DivisionFactory {
    static func createDivision(code: String, size: Int) -> Division {
        let division = Division(code: code, size: size)
        division.students = StudentFactory.createStudents(size: size)
        return division
    }
}
