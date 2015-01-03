//
//  ViewController.swift
//  iOSBecauseWater
//
//  Created by Michael Pratt on 10/27/14.
//  Copyright (c) 2014 Michael Pratt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    //@IBOutlet weak var mapCenterPinImage: UIImageView!
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
    var searchedTypes = ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
        //2
    let locationManager = CLLocationManager()
    //delete for our locations
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
            //3
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        //Makes the mapView Controller the maps views delegate
        mapView.delegate = self
        }

    // 1
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 2
        if status == .AuthorizedWhenInUse {
            
            // 3
            locationManager.startUpdatingLocation()
            
            //4
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    // 5
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {
            
            // 6 Ask for optimal startup zoom
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 17, bearing: 0, viewingAngle: 0)
            
            // This tells the location manager to stop updating the users location, **this may need to change**
            locationManager.stopUpdatingLocation()
            fetchNearbyPlaces(location.coordinate)
        }
    }
    
    //Needed to get the users current location
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
        
        // 1
        let geocoder = GMSGeocoder()
        //Moves update location button up above bottom toolbar
        let labelHeight: CGFloat = 50
        self.mapView.padding = UIEdgeInsets(top: self.topLayoutGuide.length, left: 0, bottom: 50, right: 0)
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
            if let address = response?.firstResult() {
                
                // 3
                var allLines: String = ""
                let lines = address.lines as [String]
                for line in lines {
                    allLines=allLines+line
                }
                self.myLocation = allLines
                /*
                // 4
                UIView.animateWithDuration(0.25) {
                    self.view.layoutIfNeeded()
*/
                
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
        // 1
        mapView.clear()
        // 2
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius:mapRadius, types: searchedTypes) { places in
            for place: GooglePlace in places {
                // 3
                let marker = PlaceMarker(place: place)
                // 4
                marker.map = self.mapView
            }
        }
    }
    //@IBOutlet weak var mapView: GMSMapView!
    
    //The below code was taken out because it has to do with the pin object
    /*@IBOutlet weak var mapCenterPinImage: UIImageView!
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
    var searchedTypes = ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
    */
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    */
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