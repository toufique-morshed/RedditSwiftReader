//
//  APIs.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/12/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import Foundation

class APIs{
    static let API_PLIST = Bundle.main.path(forResource: "API", ofType: "plist")
    static let API_DIC = NSDictionary(contentsOfFile: API_PLIST!) ?? NSDictionary()
    
    static let DOMAIN = API_DIC["Domain"] as! String
    static let DATA_FORMAT = API_DIC["DataFormat"] as! String
    static let SWIFT_API = API_DIC["GetSwiftReddit"] as! String
    static let HTTP_PROTOCOL = API_DIC["Protocol"] as! String

}
