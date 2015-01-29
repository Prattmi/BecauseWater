//
//  DropMarker.swift
//  iOSBecauseWater
//
//  Created by Global App Initiative on 12/1/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

import Foundation

class PlaceMarker: GMSMarker {
    
    let place: GooglePlace
    
    
    init(place: GooglePlace) {
        self.place = place
        super.init()
        
        position = place.coordinate
        icon = UIImage(named: place.placeType+"_pin")
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = kGMSMarkerAnimationPop
    }
}