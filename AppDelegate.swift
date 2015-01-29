//
//  AppDelegate.swift
//  iOSBecauseWater
//
//  Created by Global App Initiative on 10/27/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    // 1 PUT Because Water iOS API KEY HERE in quotes
    let googleMapsApiKey = "AIzaSyB0bHO7jRepqM7JWEwNaR1Zn6Ae2zpc2jY"
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // 2
        GMSServices.provideAPIKey(googleMapsApiKey)
        return true
    }
}

