//
//  LocationService.swift
//  PlacesProject
//
//  Created by Amy Ha on 03/01/2021.
//  Copyright © 2021 Amy Ha. All rights reserved.
//

import UIKit
import CoreLocation

class LocationService: NSObject {
    
    var locationManager: CLLocationManager!
    var viewController: UIViewController!
    
    init(_ vc: UIViewController) {

        self.locationManager = CLLocationManager()
        viewController = vc
    }
    
    func checkLocationServices(completion: @escaping (CLLocation?, CLAuthorizationStatus?) -> ()) {
        if CLLocationManager.locationServicesEnabled() {
            setUpLocationManager()
            checkLocationAuthorization{ status in
                completion(self.locationManager.location, status)
            }
        } else {
            self.alertUsersTurnOnLocation()
            completion(nil, nil)
        }
    }
    
    private func setUpLocationManager() {
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuthorization(completion: @escaping (CLAuthorizationStatus?) -> ()) {
        switch CLLocationManager.authorizationStatus() {
            
        case .authorizedWhenInUse:
            completion(.authorizedWhenInUse)
        case .denied:
            self.alertUsersTurnOnLocation()
            completion(.denied)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            completion(.notDetermined)
        case .restricted:
            self.alertUsersTurnOnLocation()
            completion(.restricted)
        case .authorizedAlways:
            completion(.authorizedAlways)
        @unknown default:
            fatalError("Unknown authorisation status")
        }
    }
    
    private func alertUsersTurnOnLocation() {
        let alert = UIAlertController(title: "", message: "Please turn on device location services to find current coordinates", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.viewController.present(alert, animated: true, completion: nil)
    }
    
    func getLatitude() -> String? {
        if let latitude = locationManager.location?.coordinate.latitude {
            return String(latitude)
        } else {
            return nil
        }
    }
    
    func getLongitude() -> String? {
        if let longitude = locationManager.location?.coordinate.longitude {
            return String(longitude)
        } else {
            return nil
        }
    }
    
    func getAuthorisationStatus() -> CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
}
