//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Vlasto, Benedict (JDN) on 11/02/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    @IBOutlet var strengthPicker: UIPickerView!
    @IBOutlet var weaknessPicker: UIPickerView!
    @IBOutlet var improvementPicker: UIPickerView!
    @IBOutlet var subjectInput: UITextField!
    @IBOutlet var enjoymentSegmentsDisplay: UISegmentedControl!
    @IBOutlet var strengthTextField: UITextField!
    @IBOutlet var weaknessTextField: UITextField!
    @IBOutlet var improvementTextField: UITextField!
    @IBOutlet var commentCardOutput: UITextView!
    @IBOutlet var characterCount: UILabel!
    
    
    let commentCard = CommentCard(content: "")
    let commentCardWriter = CommentCardWriter()
    var enjoyment: Int = 1
    let strengthArray = ["my EWs", "the classwork"]
    let weaknessArray = ["my EWs", "the classwork"]
    let improvementArray = ["ask more questions in class", "put in some extra time outside of class"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentCardOutput.text = "Comment card output here..."
        
        commentCardOutput.delegate = self
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
    
    func textViewDidChange(_ textView: UITextView) {
        characterCount.text = String(commentCardOutput.text.count)
    }
    
    @IBAction func enjoymentSegments(_ sender: Any) {
        enjoyment = enjoymentSegmentsDisplay.selectedSegmentIndex + 1
    }
    
    @IBAction func generateCommentCard(_ sender: Any) {
        
        var strength: String = ""
        var weakness: String = ""
        var improvement: String = ""
        
        if strengthTextField.text == "" {
            strength = strengthArray[strengthPicker.selectedRow(inComponent: 0)]
        } else {
            strength = strengthTextField.text!
        }
        
        if weaknessTextField.text == "" {
            weakness = weaknessArray[weaknessPicker.selectedRow(inComponent: 0)]
        } else {
            weakness = weaknessTextField.text!
        }
        
        if improvementTextField.text == "" {
            improvement = improvementArray[improvementPicker.selectedRow(inComponent: 0)]
        } else {
            improvement = improvementTextField.text!
        }
        
        if subjectInput.text == "" {
            createAlert(caller: "subject")
        } else {
            commentCard.content = commentCardWriter.writeContent(enjoyment: enjoyment, strength: strength, weakness: weakness, thingToImprove: improvement, subject: subjectInput.text!)
            commentCardOutput.text = commentCard.content
            characterCount.text = String(commentCard.content.count)
        }
        
    }
    
}
