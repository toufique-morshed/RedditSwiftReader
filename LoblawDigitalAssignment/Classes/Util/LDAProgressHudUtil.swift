//
//  LDAProgressHudUtil.swift
//  LoblawDigitalAssignment
//
//  Created by Tamal, Md Toufique Morshed on 5/12/20.
//  Copyright © 2020 Tamal, Md Toufique Morshed. All rights reserved.
//

import Foundation
import MBProgressHUD

class LDAProgressHudUtil {
    class func showProgressHuD(context: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            return MBProgressHUD.showAdded(to: context.view, animated: animated)
        }
    }
    
    class func hideAllProgressHuds(context: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: context.view, animated: animated)
        }
    }
    
    class func hideProgressHud(hud: MBProgressHUD?, animated: Bool) {
        DispatchQueue.main.async {
            hud?.hide(animated: animated);
        }
    }
}
