//
//  StoreController.swift
//  iOSBecauseWater
//
//  Created by Michael Pratt on 12/17/14.
//  Copyright (c) 2014 Michael Pratt. All rights reserved.
//

import Foundation


class StoreController:UIViewController {
    
    //connect the purchase button to the Because Water URL
    @IBAction func sendToStore(sender: UIButton) {
         UIApplication.sharedApplication().openURL(NSURL(string:"http://becausewater.org/store-2/")!)
    }
    
    
    
}