//
//  UIViewController+Activity.swift
//  Activity-Swift
//
//  Created by liangzc on 2017/6/14.
//  Copyright © 2017年 xlb. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension UIViewController {

    struct ActivityKey {
        static var ActivityIndicatorViewKey = "UIActivityIndicatorView"
        static var MessageLabelKey = "MessageLabel"
        static let TitleTextFontSize : CGFloat = 18.0
        static let Spacing : CGFloat = 16.0
        static let BarItemWidth : CGFloat = 52.0
        static let TitleViewHeight : CGFloat = 44.0
        static let MessageTextFontSize : CGFloat = 15.0
    }
    
    func navigationActivity() {
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 4 * ViewController.ActivityKey.Spacing - 2 * ViewController.ActivityKey.BarItemWidth, height: ViewController.ActivityKey.TitleViewHeight))
        
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: ViewController.ActivityKey.TitleTextFontSize)
        title.textColor = UIColor.white
        title.text = self.title
        titleView.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.center.equalTo(titleView)
        }
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        titleView.addSubview(activity)
        activity.snp.makeConstraints { (make) in
            make.right.equalTo(title.snp.left).offset(-10)
            make.centerY.equalTo(title)
        }
        self.navigationItem.titleView = titleView
        activity.startAnimating()
        
        objc_setAssociatedObject(self, &(ViewController.ActivityKey.ActivityIndicatorViewKey), activity,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func activity() {
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        self.view.addSubview(activity)
        activity.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        activity.startAnimating()
        
        objc_setAssociatedObject(self, &(ViewController.ActivityKey.ActivityIndicatorViewKey), activity,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func activityWithMessage(message: String) {
        let messageLabel = UILabel()
        messageLabel.font = UIFont.systemFont(ofSize: ViewController.ActivityKey.MessageTextFontSize)
        messageLabel.textColor = UIColor.darkGray
        messageLabel.text = message
        self.view .addSubview(messageLabel)
        messageLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(2 * ViewController.ActivityKey.Spacing)
        }
        
        objc_setAssociatedObject(self, &(ViewController.ActivityKey.MessageLabelKey), messageLabel, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        self.activity()
    }
    
    func isActiviting() -> Bool {
        let activity = objc_getAssociatedObject(self, &(ViewController.ActivityKey.ActivityIndicatorViewKey)) as?UIActivityIndicatorView
        return activity!.isAnimating
    }
    
    func hidenActivity() {
        let activity = objc_getAssociatedObject(self, &(ViewController.ActivityKey.ActivityIndicatorViewKey)) as!UIActivityIndicatorView
        activity.stopAnimating()
        activity.removeFromSuperview()
        
        let messageLebel = objc_getAssociatedObject(self, &(ViewController.ActivityKey.MessageLabelKey)) as?UILabel
        if let label = messageLebel {
            label.isHidden = true
            label.removeFromSuperview()
        }
    }
    
    func clearActivities() {
        let subviews = self.view.subviews
        for subview in subviews {
            if subview.isKind(of: UIActivityIndicatorView.self) || subview.isKind(of: UILabel.self) {
                subview.removeFromSuperview()
            }
            if subview.isKind(of: UIButton.self) {
                let button = subview as!UIButton
                button.isSelected = false
            }
        }
        if let navSubviews = self.navigationItem.titleView?.subviews {
            for navSubview in navSubviews {
                if navSubview.isKind(of: UIActivityIndicatorView.self) {
                    navSubview.removeFromSuperview()
                }
            }
        }
    }
}
