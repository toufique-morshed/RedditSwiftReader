//
//  LDANewsDetailesViewController.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/13/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import UIKit

class LDANewsDetailsViewController: UIViewController {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDetails: UILabel!
    
    var newDetailsText = ""
    var navigationTitle = ""
    var imageUrl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setComponents()
    }
    
    func setComponents() {
        self.title = navigationTitle
        self.newsDetails.text = newDetailsText + newDetailsText + newDetailsText + newDetailsText;
        if let imageUrl = self.imageUrl {
            //TODO: load image
        } else {
            self.newsImage.removeFromSuperview()
        }
        
        
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
