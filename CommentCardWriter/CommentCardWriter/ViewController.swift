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
    @IBOutlet var subjectInput: UITextField!
    @IBOutlet var enjoymentSegmentsDisplay: UISegmentedControl!
    @IBOutlet var strengthTextField: UITextField!
    @IBOutlet var weaknessTextField: UITextField!
    @IBOutlet var improvementTextField: UITextField!
    
    
    let commentCard = CommentCard(content: "")
    let commentCardWriter = CommentCardWriter()
    var enjoyment: Int = 3
    let strengthArray = ["my EWs", "the classwork", "other"]
    let weaknessArray = ["my EWs", "the classwork", "other"]
    let improvementArray = ["ask more questions in class", "put in some extra time outside of class", "other"]

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
    
    func createAlert(caller: String) {
        let alert = UIAlertController(title: "No \(caller) provided!", message: "Please provide a \(caller).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
    
    @IBAction func enjoymentSegments(_ sender: Any) {
        enjoyment = enjoymentSegmentsDisplay.selectedSegmentIndex + 1
    }
    
    @IBAction func generateCommentCard(_ sender: Any) {
        
        var weakness = weaknessArray[weaknessPicker.selectedRow(inComponent: 0)]
        var strength = strengthArray[strengthPicker.selectedRow(inComponent: 0)]
        var improvement = improvementArray[improvementPicker.selectedRow(inComponent: 0)]
        
        if strengthArray[strengthPicker.selectedRow(inComponent: 0)] == "other" {
            if strengthTextField.text == "" {
                createAlert(caller: "strength")
            } else {
                strength = strengthTextField.text!
            }
        }
        
        if weaknessArray[weaknessPicker.selectedRow(inComponent: 0)] == "other" {
            if weaknessTextField.text == "" {
                createAlert(caller: "weakness")
            } else {
                weakness = weaknessTextField.text!
            }
        }
        
        if improvementArray[improvementPicker.selectedRow(inComponent: 0)] == "other" {
            if improvementTextField.text == "" {
                createAlert(caller: "improvement")
            } else {
                improvement = improvementTextField.text!
            }
        }
        
        if subjectInput.text == "" {
            createAlert(caller: "subject")
        } else {
            commentCard.content = commentCardWriter.writeContent(enjoyment: enjoyment, strength: strength, weakness: weakness, thingToImprove: improvement, subject: subjectInput.text!)
            commentCardOutput.text = commentCard.content
        }
        
    }
    
}
