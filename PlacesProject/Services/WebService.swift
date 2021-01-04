//
//  WebService.swift
//  PlacesProject
//
//  Created by Amy Ha on 01/01/2021.
//  Copyright © 2021 Amy Ha. All rights reserved.
//
//  Generic class for calling web services

import Reachability

class WebService {
    
    // Are we connected to the network?
    static func isConnected() -> Bool {
        return Reachability.forInternetConnection().currentReachabilityStatus() != .NotReachable
    }
    
    func loadPlaces(url: URL, completion: @escaping ([Place]?) -> ()) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil)
                    fatalError("Error obtaining data: \(error)")
                } else if let data = data {
                    let placeList = try? JSONDecoder().decode(PlaceList.self, from: data)

                    if let placeList = placeList {
                        completion(placeList.places)
                    } else {
                        completion(nil)
                        fatalError("Error decoding object")
                    }
                }
            }.resume()
    }
    
    func showConnectionMessage(_ vc: UIViewController) {

        let alert = UIAlertController(title: "No Connection", message: "Please connect to the internet", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
        return
    }
}
