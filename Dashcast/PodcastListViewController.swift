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
        // http://www.hackingwithswift.com/read/7/3/parsing-json-nsdata-and-swiftyjson
        
        var urlString = "https://spreadsheets.google.com/feeds/list/1w3lHCYJ_NrBLlFkoLYqmUZKfaoIMBJ0DUjC74IBWqlk/od6/public/values?alt=json"
        
        if let url = NSURL(string: urlString) {
            
            if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) {
                
                let json = JSON(data: data)
                parseJSON(json)
            }
            else{
                println("something wrong of the json data")
            }
        }
        else{
            println("something wrong of the url")
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
        cell.subtitleLabel!.text = objects[indexPath.row]["download"]
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var podcastDashViewController = PodcastDashViewController(nibName: "PodcastDashViewController", bundle: nil)
        
        self.navigationController?.pushViewController(podcastDashViewController, animated: true)
    }
    
    func configureTableView() {
        tableView!.rowHeight = UITableViewAutomaticDimension
        tableView!.estimatedRowHeight = 160.0
    }

    func parseJSON(json: JSON) {
        for result in json["feed"]["entry"].arrayValue {
            let title = result["gsx$name"]["$t"].stringValue
            let created_at = result["gsx$showcreatedat"]["$t"].stringValue
            let download = result["gsx$sum"]["$t"].stringValue
            let obj = ["title": title, "created_at": created_at, "download": download]
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
