//
//  PlacesListViewController.swift
//  PlacesProject
//
//  Created by Amy Ha on 30/12/2020.
//  Copyright © 2020 Amy Ha. All rights reserved.
//

import UIKit
import CoreLocation

class PlacesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    @IBOutlet var invalidInputLabel: UILabel!
    @IBOutlet var currentLocationButton: UIButton!
    
    var placeListVM: PlaceListViewModel!
    var locationServices: LocationService!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.placeListVM.numberofRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as? PlaceCell else {
            fatalError("PlaceCell not found")
        }
        
        let placeVM = self.placeListVM.placeAtIndex(indexPath.row)
        cell.configure(placeVM)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return placeListVM == nil ? 0: self.placeListVM.numberOfSections
    }
    
    private func setUp() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.invalidInputLabel.alpha = 0
        
        locationServices = LocationService(self)
        locationServices.locationManager?.delegate = self
    }
    
    private func searchPlaces() {
        guard let latitudeString = latitudeTextField.text, let longitudeString = longitudeTextField.text else {
            return
        }
        
        guard let latitude = latitudeString.doubleValue, let longitude = longitudeString.doubleValue else {
            self.invalidInputLabel.alpha = 1
            return
        }
        
        guard let url = URL(string: "\(Constants.URL.apiUrl)\(latitude),\(longitude)") else {
            fatalError("Error obtaining URL")
        }
        
        WebService().loadPlaces(url: url) { places in

            if let places = places {

                self.placeListVM = PlaceListViewModel(places: places)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func currentLocationButtonPressed() {
        
        self.locationServices.locationManager?.delegate = self
        self.locationServices.checkLocationServices() { _, status in
            
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                self.latitudeTextField.text = self.locationServices.getLatitude()
                self.longitudeTextField.text = self.locationServices.getLongitude()
            }
        }

        
    }
    
    @IBAction func searchButtonPressed() {
        
        self.invalidInputLabel.alpha = 0
        self.latitudeTextField.resignFirstResponder()
        self.longitudeTextField.resignFirstResponder()
        
        if !WebService.isConnected() {
            WebService().showConnectionMessage(self)
        }
        
        searchPlaces()
    }
}

extension PlacesListViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if locationServices.getAuthorisationStatus() == .authorizedWhenInUse || locationServices.getAuthorisationStatus() == .authorizedAlways {
                self.latitudeTextField.text = locationServices.getLatitude()
                self.longitudeTextField.text = locationServices.getLongitude()
            }
    }
}
