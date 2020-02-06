//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Vlasto, Benedict (JDN) on 06/02/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class Absence {
    var takenOn: Date
    var present: [Student] = []
    var absent: [Student] = []
    
    init(date: Date) {
        takenOn = date
    }
}
