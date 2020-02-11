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
    
    let commentCard = CommentCard(subject: "computer science", teacher: "DPC", content: "")
    let commentCardWriter = CommentCardWriter()
    let strengthArray = ["EW", "Thing", "bread"]
    let weaknessArray = ["classwork"]
    let improvementArray = ["asking questions"]

    override func viewDidLoad() {
        super.viewDidLoad()

        createCommentCardContent()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == strengthPicker {
            return strengthArray.count
        } else if pickerView == weaknessPicker {
            return weaknessArray.count
        } else {
            return improvementArray.count
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func createCommentCardContent() {
        commentCard.content = commentCardWriter.writeContent(strength: "EWs", weakness: "the classwork", thingToImprove: "ask more questions in class")
        print(commentCard.content)
    }

}
