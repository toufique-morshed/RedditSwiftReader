//
//  NetworkManager.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/12/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//
import Alamofire
import Foundation
import ObjectMapper

class NetworkManager {
    
    private let session: Session
    public let configuration: URLSessionConfiguration
    public let delegate: Alamofire.SessionDelegate
    
    private static var sharedNetworkManager: NetworkManager = {
        let apiManager = NetworkManager()
        return apiManager
    }()
    
    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
    
    private init() {
        configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        session = Alamofire.Session(configuration: configuration, interceptor: nil)
        delegate = session.delegate
    }
    
    func request<T : Mappable>(method : HTTPMethod, url : String ,param: LDAParameterizable?, onSucceeded: ((T) -> Void)?, onFailed: ((NSError?) -> Void)?){
        let headers: HTTPHeaders = [
            .accept("application/json")
        ]
        session.request(url, method: method, parameters: param?.param(), headers: headers)
            .responseJSON { response in
                if((response.error) != nil) {
                    if let error = response.error as NSError? {
                        onFailed?(error)
                    }
                } else {
                    guard let json = response.value as? [String : AnyObject] else {
                        if let error = response.error as NSError? {
                            onFailed?(error)
                        }
                        return
                    }
                    
                    guard let mapped = Mapper<T>().map(JSONObject: json) else {
                        if let error = response.error as NSError? {
                            onFailed?(error)
                        }
                        return
                    }
                    
                    onSucceeded?(mapped)
                }
        }
    }
}
