//
//  CardView.swift
//  Dashcast
//
//  Created by Jia Chen on 6/30/15.
//  Copyright (c) 2015 com.bruinSquare. All rights reserved.
//

import UIKit
import Cartography

class CardView: UIView {
    @IBOutlet var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        // Shadow
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOpacity = 0.33
        layer.shadowOffset = CGSizeMake(0, 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.mainScreen().scale
        
        // Corner Radius
        layer.cornerRadius = 10.0;
        
        // UILabel
        textLabel = UILabel(frame: CGRectMake(10, 10, 200, 300))
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.font = UIFont(name: "Merriweather-Bold", size: 17)
        textLabel.numberOfLines = 0
        //textLabel.sizeToFit()
        self.addSubview(textLabel)
        layout(textLabel, self){view1, view2 in
            view1.left == view2.left+50
            view1.right == view2.right-50
            view1.top == view2.top + 120
            view1.bottom == view2.bottom - 100
        
        }
    }

}
