//
//  CommentCardWriter.swift
//  CommentCardWriter
//
//  Created by Vlasto, Benedict (JDN) on 11/02/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class CommentCardWriter {
    
    let strength: String = ""
    let weakness: String = ""
    let thingToImprove: String = ""
    let subject: String = ""
    
    func writeContent(strength: String, weakness: String, thingToImprove: String) -> String {
        return("I've been really enjoying \(subject) so far, and I feel particularly confident with my \(strength). However, I'm struggling a bit with \(weakness), and I know I could \(thingToImprove), which I'll work on.")
    }
    
}
