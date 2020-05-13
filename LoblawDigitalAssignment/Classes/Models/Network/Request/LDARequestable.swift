//
//  LDARequestable.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/12/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

protocol LDARequestable{
    func request<T: Mappable>(param: LDAParameterizable?, onSucceeded : ((T) -> Void)?, onFailed : ((NSError?) -> Void)?)
}
