//
//  UIView+frame.swift
//  Activity-Swift
//
//  Created by liangzc on 2017/6/16.
//  Copyright © 2017年 xlb. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setX(x: CGFloat) {
        var frame = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    
    func x() -> CGFloat {
        return self.frame.origin.x
    }
    
    func setY(y: CGFloat) {
        var frame = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    
    func y() -> CGFloat {
        return self.frame.origin.y
    }
    
    func setCenterX(centerX: CGFloat) {
        var center = self.center
        center.x = centerX
        self.center = center
    }
    
    func centerX() -> CGFloat {
        return self.center.x
    }
    
    func setCenterY(centerY: CGFloat) {
        var center = self.center
        center.y = centerY
        self.center = center
    }
    
    func centerY() -> CGFloat {
        return self.center.y
    }
    
    func setWidth(width: CGFloat) {
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
    }
    
    func width() -> CGFloat {
        return self.frame.size.width
    }
    
    func setHeight(height: CGFloat) {
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    func height() -> CGFloat {
        return self.frame.size.height
    }
    
    func setSize(size: CGSize) {
        var frame = self.frame
        frame.size = size
        self.frame = frame
    }
    
    func size() -> CGSize {
        return self.frame.size
    }
    
    
}


