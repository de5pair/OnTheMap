//
//  StudentInformation.swift
//  OnTheMap
//
//  Created by Boris Alexis Gonzalez Macias on 7/19/15.
//  Copyright (c) 2015 PropiedadFacil. All rights reserved.
//

import Foundation
import MapKit

struct StudentInformation {

    var firstName : String = ""
    var lastName : String = ""
    var mediaURL: String = ""
    var lat: CLLocationDegrees = 0.0
    var lng: CLLocationDegrees = 0.0
    
    init(data: [String:AnyObject]){
        self.firstName = data["firstName"] as! String
        self.lastName = data["lastName"] as! String
        self.mediaURL = data["mediaURL"] as! String
        self.lat = CLLocationDegrees(data["latitude"] as! Double)
        self.lng = CLLocationDegrees(data["longitude"] as! Double)
    }
    
    func getName() -> String{
        return "\(self.firstName) \(self.lastName)"
    }
    
    func getURL() -> String{
        return self.mediaURL
    }
    
    func getLat() -> CLLocationDegrees{
        return self.lat
    }
    func getLng() -> CLLocationDegrees{
        return self.lng
    }
    func getCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.lat, longitude: self.lng)
    }
}