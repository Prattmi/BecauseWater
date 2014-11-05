//
//  ViewController.swift
//  iOSBecauseWater
//
//  Created by Michael Pratt on 10/27/14.
//  Copyright (c) 2014 Michael Pratt. All rights reserved.
//

import UIKit

class ViewController: UIViewController/*, TypesTableViewControllerDelegate*/ {
    
    //@IBOutlet weak var mapView: GMSMapView!
    
    //The below code was taken out because it has to do with the pin object
    /*@IBOutlet weak var mapCenterPinImage: UIImageView!
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
    var searchedTypes = ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Types Segue" {
            let navigationController = segue.destinationViewController as UINavigationController

            /*let controller = segue.destinationViewController.topViewController as TypesTableViewController
            controller.selectedTypes = searchedTypes
            controller.delegate = self
            */
        }
    }
*/
    /*
    // MARK: - Types Controller Delegate
    func typesController(controller: TypesTableViewController, didSelectTypes types: [String]) {
    searchedTypes = sorted(controller.selectedTypes)
    dismissViewControllerAnimated(true, completion: nil)
    }
    */
        //Code taken out for map
        /*import UIKit
        
        class ViewController: UIViewController {
        
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
        
        
        }
        
        */
}