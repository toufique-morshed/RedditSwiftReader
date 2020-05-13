//
//  LDARedditRequest.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/12/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class LDARedditRequest: LDARequestable {
    init() {}
    func request<T: Mappable>(param: LDAParameterizable?, onSucceeded : ((T) -> Void)?, onFailed : ((NSError?) -> Void)?){
        let endPoint : String = APIs.HTTP_PROTOCOL + APIs.DOMAIN + APIs.SWIFT_API + APIs.DATA_FORMAT
        NetworkManager.shared().request(method: HTTPMethod.get, url: endPoint, param: nil, onSucceeded: onSucceeded, onFailed: onFailed)
    }
}
