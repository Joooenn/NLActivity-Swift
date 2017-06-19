//
//  ButtonActivityViewController.swift
//  Activity-Swift
//
//  Created by liangzc on 2017/6/19.
//  Copyright © 2017年 xlb. All rights reserved.
//

import UIKit

class ButtonActivityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ButtonActivity"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonActivity(_ sender: UIButton) {
        
        if sender.isActiviting() {
            sender.hidenActivity()
        } else {
            sender.activity()
        }
    }
    
    @IBAction func buttonActivityWithBG(_ sender: UIButton) {
        
        if sender.isActiviting() {
            sender.hidenActivity()
        } else {
            sender.activityWithStyle(style: .white)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
