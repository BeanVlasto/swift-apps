//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Vlasto, Benedict (JDN) on 01/03/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

struct ArtistResponse: Codable {
    var resultCount: Int
    var results: [Artist]
}
