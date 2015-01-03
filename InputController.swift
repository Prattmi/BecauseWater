//
//  InputController.swift
//  iOSBecauseWater
//
//  Created by Michael Pratt on 12/16/14.
//  Copyright (c) 2014 Michael Pratt. All rights reserved.
//

import Foundation
import UIKit

class InputController: UIViewController {
    
    var currentAddress: String = ViewController().populateTextField()
    
    @IBOutlet weak var addressToInput: UITextField!
    
    @IBAction func populateCurrentLocation(sender: AnyObject) {
        self.addressToInput.placeholder = currentAddress
    }
    
    
        
}