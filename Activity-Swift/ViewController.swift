//
//  ViewController.swift
//  Activity-Swift
//
//  Created by liangzc on 2017/6/14.
//  Copyright © 2017年 xlb. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Activity"
    }
    
    @IBAction func startNavigationActivity(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.navigationActivity()
        } else {
            self.hidenActivity()
        }
    }

    @IBAction func startActivity(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.activity()
        } else {
            self.hidenActivity()
        }
    }
    
    @IBAction func startActivityWithMessage(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if !sender.isSelected {
            self.hidenActivity()
        } else {
            self.activityWithMessage(message: "Loading...")
        }
    }
    
    @IBAction func clearActivities(_ sender: UIButton) {
        self.clearActivities()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

