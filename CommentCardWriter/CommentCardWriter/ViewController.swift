//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Vlasto, Benedict (JDN) on 11/02/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var strengthPicker: UIPickerView!
    @IBOutlet var weaknessPicker: UIPickerView!
    @IBOutlet var improvementPicker: UIPickerView!
    @IBOutlet var commentCardOutput: UILabel!
    
    let commentCard = CommentCard(subject: "computer science", teacher: "DPC", content: "")
    let commentCardWriter = CommentCardWriter()
    let strengthArray = ["my EWs", "the classwork"]
    let weaknessArray = ["my EWs", "the classwork"]
    let improvementArray = ["ask more questions in class"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentCardOutput.text = ""
        
        strengthPicker.dataSource = self
        strengthPicker.delegate = self
        weaknessPicker.dataSource = self
        weaknessPicker.delegate = self
        improvementPicker.dataSource = self
        improvementPicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == strengthPicker {
            return strengthArray.count
        } else if pickerView == weaknessPicker {
            return weaknessArray.count
        } else if pickerView == improvementPicker {
            return improvementArray.count
        }
        
        return(1)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == strengthPicker {
            return strengthArray[row]
        } else if pickerView == weaknessPicker {
            return weaknessArray[row]
        } else if pickerView == improvementPicker {
            return improvementArray[row]
        }
        
        return("Something went wrong.")
    }
    
    @IBAction func generateCommentCard(_ sender: Any) {
        commentCard.content = commentCardWriter.writeContent(strength: strengthArray[strengthPicker.selectedRow(inComponent: 0)], weakness: weaknessArray[weaknessPicker.selectedRow(inComponent: 0)], thingToImprove: improvementArray[improvementPicker.selectedRow(inComponent: 0)], subject: commentCard.subject)
        commentCardOutput.text = commentCard.content
    }
    
}
