//
//  UITableViewCell+Activity.swift
//  Activity-Swift
//
//  Created by liangzc on 2017/6/15.
//  Copyright © 2017年 xlb. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

var kActivityIndicatorKey = "ActivityIndicatorView"

extension UITableViewCell {
    
    struct tableCell {
        var ActivityIndicatorKey = "ActivityIndicatorView"
        let Spacing : CGFloat = 8.0
    }
    
    enum ActivityPoint {
        case left
        case right
        case center
    }
    
    func activity(point: ActivityPoint) {
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        self.contentView.addSubview(activity)
        self.layoutActivity(act: activity, po: point)
        activity.startAnimating()
        
        objc_setAssociatedObject(self, &kActivityIndicatorKey, activity, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
    }
    
    func hidenActivity() {
        let activity = objc_getAssociatedObject(self, &kActivityIndicatorKey) as!UIActivityIndicatorView
        activity.stopAnimating()
        activity.removeFromSuperview()
    }
    
    func isActiviting() -> Bool {
        let activity = objc_getAssociatedObject(self, &kActivityIndicatorKey) as?UIActivityIndicatorView
        if let cellActivity = activity {
            return cellActivity.isAnimating
        } else {
            return false
        }
        
    }
    
    func layoutActivity(act: UIActivityIndicatorView, po: ActivityPoint) {
        
        act.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            switch po {
            case .left:
                let view = self.referView(po: po)
                make.left.equalTo(view.snp.right).offset(tableCell().Spacing)
            case .center:
                make.centerX.equalTo(self.contentView)
            case .right:
                make.right.equalTo(self).offset(-(2 * tableCell().Spacing))
            }
        }
    }
    
    
    func referView(po: ActivityPoint) -> UIView {
        
        let screenWidth = UIScreen.main.bounds.size.width
        
        let leftViews = self.contentView.subviews.filter { (view) -> Bool in
            return view.centerX() < screenWidth / 2
        }
        let centerViews = self.contentView.subviews.filter { (view) -> Bool in
            return view.centerX() == screenWidth / 2
        }
        let rightViews = self.contentView.subviews.filter { (view) -> Bool in
            return view.centerX() > screenWidth / 2
        }
        
        switch po {
        case .left:
            return leftViews.first!
        case .center:
            return centerViews.first!
        case .right:
            return rightViews.first!
        }
    }
}
