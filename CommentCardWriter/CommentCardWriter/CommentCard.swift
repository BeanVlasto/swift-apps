//
//  CommentCard.swift
//  CommentCardWriter
//
//  Created by Vlasto, Benedict (JDN) on 11/02/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class CommentCard {
    
    let subject: String
    //let subjectCode: String
    let teacher: String
    var content: String
    
    init(subject: String, teacher: String, content: String) {
        self.subject = subject
        self.teacher = teacher
        self.content = content
    }
    
    /*func returnCommentCardContent() -> String {
        let commentCardWriter = CommentCardWriter()
        return commentCardWriter.writeContent(strength: "EWs", weakness: "the classwork", thingToImprove: "asking questions in class.")
    }*/
    
}
