//
//  MainViewController.swift
//  Activity-Swift
//
//  Created by liangzc on 2017/6/19.
//  Copyright © 2017年 xlb. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let dataArray = ["normalActivity","tableCellActivity", "buttonActivity"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Activity"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITableView Delegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc : UIViewController? = nil
        switch indexPath.row {
        case 0:
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NormalActivitVC")
        case 1:
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableCellActivityVC")
        case 2:
            vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ButtonActivityViewController")
        default:
            break
        }
        self.navigationController!.pushViewController(vc!, animated: true)
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
