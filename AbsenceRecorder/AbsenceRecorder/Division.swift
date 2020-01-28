//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Vlasto, Benedict (JDN) on 28/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class Division {
    let code: String
    var size: Int
    var students: [Student] = []
    
    init(code: String, size: Int) {
        self.code = code
        self.size = size
    }
}
