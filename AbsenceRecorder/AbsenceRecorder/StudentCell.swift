//
//  StudentCell.swift
//  AbsenceRecorder
//
//  Created by Vlasto, Benedict (JDN) on 06/02/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.accessoryType = selected ? .checkmark : .none
        self.selectionStyle = .none
    }

}
