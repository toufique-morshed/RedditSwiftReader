//
//  LDARedditListViewModel.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/12/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import Foundation

class LDARedditListViewModel {
    //create all the publinks
    
    var newsDetails = [LDANewsDetails]()
    
    func requestRedditList() {
        LDARedditRequest().request(param: nil, onSucceeded: { (response :LDARedditResponse) in
            self.newsDetails = response.newsDetails
            NotificationCenter.default.post(name: Notification.Name(Constants.NEWS_ARRIVED_SUCCESS), object: nil)
            
        }, onFailed: {error in
            NotificationCenter.default.post(name: Notification.Name(Constants.NEWS_ARRIVED_FAILED), object: nil)
        })
    }
}
