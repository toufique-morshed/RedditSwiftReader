//
//  LDARedditResponse.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/12/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import Foundation
import ObjectMapper


class LDARedditResponse: Mappable {
    var count: Int
    var newsDetails = [LDANewsDetails]()
    
    required init?(map: Map) {
        count = 0
    }
    
    func mapping(map: Map) {
        count <- map["data.dist"]
        for i in 0...count - 1 {
            var temp: LDANewsDetails?
            temp <- map["data.children." + String(i) + ".data"]
            if let temp = temp {newsDetails.append(temp)}
        }
    }
}
