//
//  TableCellActivityViewController.swift
//  Activity-Swift
//
//  Created by liangzc on 2017/6/15.
//  Copyright © 2017年 xlb. All rights reserved.
//

import UIKit

class TableCellActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let dataArray = ["leftActivity","centerActivity","rightActivity"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TableViewCellActivity"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark UITablView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.detailTextLabel?.text = "Activity"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if let myCell = cell {
            if myCell.isActiviting() {
                myCell.hidenActivity()
            } else {
                if indexPath.row == 0 {
                    myCell.activity(point: .left)
                } else if indexPath.row == 1 {
                    myCell.activity(point: .center)
                } else {
                    myCell.activity(point: .right)
                }
            }
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
