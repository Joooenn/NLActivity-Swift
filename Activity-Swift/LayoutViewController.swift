//
//  LayoutViewController.swift
//  Activity-Swift
//
//  Created by liangzc on 2017/6/16.
//  Copyright © 2017年 xlb. All rights reserved.
//

import UIKit
import SnapKit

class LayoutViewController: UIViewController {
    
    let subView = UIView()
    let superView = UIView()
    var top = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "layout"
        
        self.setupViews()
    }
    
    private func setupViews() {
        
        self.view.backgroundColor = UIColor.white
        
        superView.backgroundColor = UIColor.brown
        self.view.addSubview(superView)
        
        subView.backgroundColor = UIColor.blue
        superView.addSubview(subView)
        
        self.layoutViews()
        
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("BUTTON", for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.addTarget(self, action: #selector(LayoutViewController.buttonDidSelect), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(superView.snp.bottom).offset(20)
        }
    }
    
    func layoutViews() {
        superView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        subView.snp.makeConstraints { (make) in
            make.centerX.equalTo(superView)
            make.top.equalTo(superView.snp.top).offset(top)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
    }
    
    func buttonDidSelect() {
        
        subView.setY(y: 100)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
     MARK: - Navigation
     
     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destinationViewController.
         Pass the selected object to the new view controller.
    }
    */
    
}
