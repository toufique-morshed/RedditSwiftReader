//
//  LDANewsDetails.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/13/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import Foundation
import ObjectMapper

class LDANewsDetails: NSObject, Mappable {
    var title : String?
    var body : String?
    var thumbnail : String?
    var thumbnail_height : Int?
    var thumbnail_width : Int?

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        body <- map["selftext"]
        thumbnail <- map["thumbnail"]
        thumbnail_height <- map["thumbnail_height"]
        thumbnail_width <- map["thumbnail_width"]
    }
}
