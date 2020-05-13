//
//  ViewController.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/12/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var newsTable: UITableView!
    var news = ["news1", "news2", "new3", "new4", "news5"]
    var newsDetails = ["Des1", "Des1", "Des3", "Des4","Des5"]
    
//    var progressHd: MBProgressHUD?
//    var redditListviewModel: LDARedditListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        print(APIs.DOMAIN)
//        print(APIs.SWIFT_API)
//        print(APIs.DATA_FORMAT)
//
//        print("Calling")
////        let req = LDARedditRequest()
////        LDAProgressHudUtil.showProgressHuD(context: self, animated: true)
////        req.request(param: nil, onSucceeded: dataLoaded(data:), onFailed: dataFailed(error:))
//        initiateViewModels()
        
        
        
    }
    
//    func initiateViewModels() {
//        self.redditListviewModel = LDARedditListViewModel();
//        redditListviewModel?.requestRedditList()
//    }
//
//    func dataLoaded(data: LDARedditResponse) {
//        print("Data loaded success")
//        LDAProgressHudUtil.hideAllProgressHuds(context: self, animated: false)
//    }
//    func dataFailed(error: NSError?) {
//        print("FAILED")
//        LDAProgressHudUtil.hideAllProgressHuds(context: self, animated: false)
//    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? LDANewsTableViewCell
        cell?.newsTitle.text = news[indexPath.row]
        cell?.newsThumbnail.removeFromSuperview()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = (storyboard?.instantiateViewController(identifier: "LDANewsDetailsViewController") as? LDANewsDetailsViewController)!
        detailVC.newDetailsText = self.newsDetails[indexPath.row]
        detailVC.navigationTitle = self.news[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

