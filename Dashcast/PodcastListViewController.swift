//
//  PodcastListViewController.swift
//  Dashcast
//
//  Created by Jia Chen on 6/28/15.
//  Copyright (c) 2015 com.bruinSquare. All rights reserved.
//

import UIKit

class PodcastListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var items = ["1","2"]
    
    @IBOutlet var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var nib = UINib(nibName: "BasicCell", bundle: nil)
        tableView?.registerNib(nib, forCellReuseIdentifier: "BasicCellIdentifier")
        
        self.configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCellIdentifier") as! BasicCell
        
        //var cell = UITableViewCell()
        cell.titleLabel!.text = "hello"
        cell.subtitleLabel!.text = "hello"
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func configureTableView() {
        tableView!.rowHeight = UITableViewAutomaticDimension
        tableView!.estimatedRowHeight = 160.0
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
