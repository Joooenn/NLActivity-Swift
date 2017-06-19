//
//  UIButton+Activity.swift
//  Activity-Swift
//
//  Created by liangzc on 2017/6/15.
//  Copyright © 2017年 xlb. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

var ActivityKey = "ButtonActivityIndicatorView"
let kSpacing : CGFloat = 16.0
let kSmallSpacing : CGFloat = 8.0
let kMessageTextFontSize :CGFloat = 15.0

extension UIButton {
    
    struct extensionKey {
        
    }
    
    enum activityStyle {
        case gray   //Defualt
        case white
        case bigWhite
    }
    
    func activity() {
        
        self.activityWithStyle(style: activityStyle.gray)
    }
    
    func activityWithStyle(style: activityStyle) {
        
        var actStyle : UIActivityIndicatorViewStyle?
        switch style {
        case .white:
            actStyle = UIActivityIndicatorViewStyle.white
        case .gray:
            actStyle = UIActivityIndicatorViewStyle.gray
        case .bigWhite:
            actStyle = UIActivityIndicatorViewStyle.whiteLarge
        }
        
        let activity = UIActivityIndicatorView.init(activityIndicatorStyle: actStyle!)
        self.addSubview(activity)
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, kSpacing)
        activity.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel!.snp.right).offset(kSmallSpacing)
            make.centerY.equalTo(self.titleLabel!)
        }
        activity.startAnimating()
        
        objc_setAssociatedObject(self, &ActivityKey, activity, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func hidenActivity() {
        let activity = objc_getAssociatedObject(self, &ActivityKey) as!UIActivityIndicatorView
        activity.stopAnimating()
        activity.removeFromSuperview()
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func isActiviting() -> Bool {
        let activity = objc_getAssociatedObject(self, &ActivityKey) as?UIActivityIndicatorView
        if let act = activity {
            return act.isAnimating
        } else {
            return false
        }
    }
}
