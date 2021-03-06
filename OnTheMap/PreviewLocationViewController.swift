//
//  previewLocationViewController.swift
//  OnTheMap
//
//  Created by Boris Alexis Gonzalez Macias on 7/19/15.
//  Copyright (c) 2015 PropiedadFacil. All rights reserved.
//

import MapKit
import UIKit

class PreviewLocationViewController : UIViewController,MKMapViewDelegate,UITextFieldDelegate{
    
    @IBOutlet weak var previewMap: MKMapView!
    @IBOutlet weak var urlField: UITextField!
    
    var latitude : Double!
    var longitude : Double!
    var mapString : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.previewMap.delegate = self
        self.urlField.delegate = self
    }
    
    @IBAction func dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func submitUrl(sender: UIButton) {
        var app = UIApplication.sharedApplication().delegate as! AppDelegate
        var studentDict = ["latitude": self.latitude, "longitude": self.longitude, "firstName": app.firstName, "lastName": app.lastName, "mediaURL": urlField.text]
        var studentInfo = StudentInformation(data: studentDict as! [String : AnyObject])
        ParseClient.sharedInstance().postStudent(studentInfo, mapString: self.mapString){(success,data) in
            if(success){
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else{
                Shared.showError(self,errorString: data["ErrorString"] as! String)
            }
            
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var annotation = MKPointAnnotation()
        
        //Adding attributes to the pin
        annotation.coordinate = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        annotation.title = "You are here"

        self.previewMap.addAnnotation(annotation)
    }
    
    // Getting rid of keyboard after hitting return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // Getting rid of keyboard after touching outside inputs
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event!)
    }

}
