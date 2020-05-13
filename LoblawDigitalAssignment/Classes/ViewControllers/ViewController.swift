//
//  ViewController.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/12/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import UIKit
import MBProgressHUD
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var newsTable: UITableView!
    
    var newsDetails = [LDANewsDetails]()
    var redditListviewModel: LDARedditListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotificationSubscription()
        instantiateViewModels()
    }
    
    func setupNotificationSubscription() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDataFetchSuccess), name: NSNotification.Name(rawValue: Constants.NEWS_ARRIVED_SUCCESS), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDataFetchFailure), name: NSNotification.Name(rawValue: Constants.NEWS_ARRIVED_FAILED), object: nil)
    }
    
    func instantiateViewModels() {
        self.redditListviewModel = LDARedditListViewModel();
        LDAProgressHudUtil.showProgressHuD(context: self, animated: true)
        redditListviewModel!.requestRedditList()
    }
    
    @objc func onDataFetchSuccess() {
        self.newsDetails = self.redditListviewModel!.newsDetails
        self.newsTable.reloadData()
        LDAProgressHudUtil.hideAllProgressHuds(context: self, animated: true)
    }
    
    @objc func onDataFetchFailure() {
        self.newsTable.reloadData()
        LDAProgressHudUtil.hideAllProgressHuds(context: self, animated: true)
        AlertControllerUtil.showAlert(viewController: self, title: Constants.DATA_FETCH_ERROR_TITLE, message: Constants.DATA_FETCH_ERROR_MESSAGE)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeNoificationSubscriptions()
    }
    
    func removeNoificationSubscriptions() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: Constants.NEWS_ARRIVED_SUCCESS), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: Constants.NEWS_ARRIVED_FAILED), object: nil)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    private func getDefaultCell(title : String) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: Constants.DEFAULT_CELL)
        cell.textLabel?.text = title;
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let imageURL = self.newsDetails[indexPath.row].thumbnail {
            if imageURL.isValidURL {
                let cell = (newsTable.dequeueReusableCell(withIdentifier: Constants.NEWS_CELL, for: indexPath) as? LDANewsTableViewCell)!
                cell.newsTitle.text = newsDetails[indexPath.row].title!
                cell.newsThumbnail.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: Constants.PLACEHOLDER_IMAGE))
                return cell
            }
        }
        return getDefaultCell(title: newsDetails[indexPath.row].title!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = (storyboard?.instantiateViewController(identifier: Constants.DETAILS_VIEW_CONTROLLER_ID) as? LDANewsDetailsViewController)!
        
        detailVC.newDetailsText = ""
        if let newsBody = self.newsDetails[indexPath.row].body?.replacingOccurrences(of: "\n", with: " ") {
            detailVC.newDetailsText = newsBody
        }
        
        if let imageUrl = self.newsDetails[indexPath.row].thumbnail {
            detailVC.imageUrl = imageUrl.isValidURL ? imageUrl : nil
        }
        detailVC.navigationTitle = self.newsDetails[indexPath.row].title!
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

