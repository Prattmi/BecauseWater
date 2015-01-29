//
//  ViewController.swift
//  iOSBecauseWater
//
//  Created by Global App Initiative on 10/27/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    //@IBOutlet weak var mapCenterPinImage: UIImageView!
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
    var searchedTypes = ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
    let locationManager = CLLocationManager()
    let dataProvider = GoogleDataProvider()
    //provides address to text field when adding a location
    var myLocation:String = ""
    
    var mapRadius: Double {
        get {
            let region = mapView.projection.visibleRegion()
            let center = mapView.camera.target
            
            let north = CLLocation(latitude: region.farLeft.latitude, longitude: center.longitude)
            let south = CLLocation(latitude: region.nearLeft.latitude, longitude: center.longitude)
            let west = CLLocation(latitude: center.latitude, longitude: region.farLeft.longitude)
            let east = CLLocation(latitude: center.latitude, longitude: region.farRight.longitude)
            
            let verticalDistance = north.distanceFromLocation(south)
            let horizontalDistance = west.distanceFromLocation(east)
            return max(horizontalDistance, verticalDistance)*0.5
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        //Makes the mapView Controller the maps views delegate
        mapView.delegate = self
        }

    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    
        if status == .AuthorizedWhenInUse {
            
            locationManager.startUpdatingLocation()
            
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {
            
            // change zoom for optimal start up view
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 17, bearing: 0, viewingAngle: 0)
            
            // This tells the location manager to stop updating the users location, **this may need to change**
            locationManager.stopUpdatingLocation()
            fetchNearbyPlaces(location.coordinate)
        }
    }
    
    //Needed to get the users current location (use for prepopulating fields and querying database)
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
        
        let geocoder = GMSGeocoder()
        //Moves update location button up above bottom toolbar
        //unneeded constant below
        //let labelHeight: CGFloat = 50
        self.mapView.padding = UIEdgeInsets(top: self.topLayoutGuide.length, left: 0, bottom: 50, right: 0)
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
            if let address = response?.firstResult() {
                
                var allLines: String = ""
                let lines = address.lines as [String]
                for line in lines {
                    allLines=allLines+line
                }
                self.myLocation = allLines
                
                
            }
        }

    }
    
    func populateTextField ()->String {
        return self.myLocation
    }

    
    //Call on this function when the map stops moving so you can make a reverse geocall
    func mapView(mapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {
        reverseGeocodeCoordinate(position.target)
    }
    
    func fetchNearbyPlaces(coordinate: CLLocationCoordinate2D) {

        mapView.clear()
        
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius:mapRadius, types: searchedTypes) { places in
            for place: GooglePlace in places {
                
                let marker = PlaceMarker(place: place)
                
                marker.map = self.mapView
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}