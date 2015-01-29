//
//  StoreController.swift
//  iOSBecauseWater
//
//  Created by Global App Initiative on 12/17/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

import Foundation


class StoreController:UIViewController {
    
    //connect the purchase button to the Because Water URL
    @IBAction func sendToStore(sender: UIButton) {
         UIApplication.sharedApplication().openURL(NSURL(string:"http://becausewater.org/store-2/")!)
    }
    
    
    
}