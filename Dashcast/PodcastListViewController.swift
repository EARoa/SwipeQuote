//
//  PodcastListViewController.swift
//  Dashcast
//
//  Created by Jia Chen on 6/28/15.
//  Copyright (c) 2015 com.bruinSquare. All rights reserved.
//

import UIKit
import SwiftyJSON

class PodcastListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var items = ["1","2"]
    var labels = [String: UILabel]()
    var strings = [String]()
    var objects = [[String: String]]()
    
    @IBOutlet var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var nib = UINib(nibName: "BasicCell", bundle: nil)
        tableView?.registerNib(nib, forCellReuseIdentifier: "BasicCellIdentifier")
        
        // We should put this part into DataManager.swift
        var urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=10"
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) {
                let json = JSON(data: data)
                
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    // we're OK to parse!
                    parseJSON(json)
                }
            }
        }
        
        tableView!.reloadData()
        
        self.configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCellIdentifier") as! BasicCell
        
        //var cell = UITableViewCell()
        cell.titleLabel!.text = objects[indexPath.row]["title"]
        cell.subtitleLabel!.text = objects[indexPath.row].description
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func configureTableView() {
        tableView!.rowHeight = UITableViewAutomaticDimension
        tableView!.estimatedRowHeight = 160.0
    }

    func parseJSON(json: JSON) {
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            objects.append(obj)
        }
        
        tableView!.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
