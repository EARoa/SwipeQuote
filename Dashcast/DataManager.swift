//
//  DataManager.swift
//  Dashcast
//
//  Created by Jia Chen on 6/28/15.
//  Copyright (c) 2015 com.bruinSquare. All rights reserved.
//

import Foundation
import SwiftyJSON

let TopAppURL = "https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=25/json"

class DataManager {
    
    class func loadDataFromURL(urlString: String){
        var strings = [String]()
        var objects = [[String: String]]()
        
        func parseJSON(json: JSON) {
            for result in json["results"].arrayValue {
                let title = result["title"].stringValue
                let body = result["body"].stringValue
                let sigs = result["signatureCount"].stringValue
                let obj = ["title": title, "body": body, "sigs": sigs]
                objects.append(obj)
            }
        }
        
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) {
                let json = JSON(data: data)
                
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    // we're OK to parse!
                    parseJSON(json)
                }
            }
        }
    }
}