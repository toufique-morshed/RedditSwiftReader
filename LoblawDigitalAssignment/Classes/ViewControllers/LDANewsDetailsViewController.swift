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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.newsDetails.text = newDetailsText;
        self.title = navigationTitle
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
