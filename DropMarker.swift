//
//  DropMarker.swift
//  iOSBecauseWater
//
//  Created by Michael Pratt on 12/1/14.
//  Copyright (c) 2014 Michael Pratt. All rights reserved.
//

import Foundation

class PlaceMarker: GMSMarker {
    // 1
    let place: GooglePlace
    
    // 2
    init(place: GooglePlace) {
        self.place = place
        super.init()
        
        position = place.coordinate
        icon = UIImage(named: place.placeType+"_pin")
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = kGMSMarkerAnimationPop
    }
}