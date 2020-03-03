//
//  CommentCardWriter.swift
//  CommentCardWriter
//
//  Created by Vlasto, Benedict (JDN) on 11/02/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class CommentCardWriter {
    
    func writeContent(enjoyment: Int, strength: String, weakness: String, thingToImprove: String, subject: String) -> String {
        if enjoyment == 1 {
            return("I'm somewhat struggling with \(subject) this term. Often, \(weakness) causes me problems and I know I could \(thingToImprove), which I'll work on. That being said, I'm feeling reasonably confident with \(strength).")
        } else if enjoyment == 2 {
            return("I'm tolerating \(subject) right now. I'm mostly enjoying \(strength), but I'm struggling a bit with \(weakness). Also, I know I could \(thingToImprove), which I'll work on.")
        } else {
            return("I've been really enjoying \(subject) so far, and I'm feeling particularly confident with \(strength). However, I'm struggling a bit with \(weakness), and I know I should \(thingToImprove), which I'll work on.")
        }
    }
    
}
