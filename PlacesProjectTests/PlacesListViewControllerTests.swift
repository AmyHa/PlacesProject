//
//  PlacesListViewControllerTests.swift
//  PlacesProjectTests
//
//  Created by Amy Ha on 04/01/2021.
//  Copyright © 2021 Amy Ha. All rights reserved.
//

import XCTest
@testable import PlacesProject

class PlacesListViewControllerTests: XCTestCase {

    var placeListVC: PlacesListViewController!
    
    override func setUp() {
        
        self.placeListVC = makePlacesListViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_placeWithNoOpeningHoursShowsAsNotApplicable() {
        let place = Place(name: "A surfing cafe", openingHours: nil, rating: 5.0)
        let placeViewModel = PlaceViewModel(place)
        
        XCTAssertEqual(placeViewModel.openingHours, "N/A")
    }
    
    func test_placeShowsOpenedNow() {
        let openingHours = OpeningHours(openNow: true)
        let place = Place(name: "A surfing cafe", openingHours: openingHours, rating: 5.0)
        let placeViewModel = PlaceViewModel(place)
        
        XCTAssertEqual(placeViewModel.openingHours, "Yes")
    }
    
    func test_placeShowsNotOpenedNow() {
        let openingHours = OpeningHours(openNow: false)
        let place = Place(name: "A surfing cafe", openingHours: openingHours, rating: 5.0)
        let placeViewModel = PlaceViewModel(place)
        
        XCTAssertEqual(placeViewModel.openingHours, "No")
    }
    
    func test_correctPlaceNameDisplayed() {
        let place = Place(name: "A surfing cafe", openingHours: nil, rating: 5.0)
        let placeViewModel = PlaceViewModel(place)
        
        XCTAssertEqual(placeViewModel.name, "A surfing cafe")
    }
    
    func test_correctRatingDisplayed() {
        let place = Place(name: "A surfing cafe", openingHours: nil, rating: 5.0)
        let placeViewModel = PlaceViewModel(place)
        
        XCTAssertEqual(placeViewModel.rating, "5 / 5")
    }
    
    func test_invalidInputLabelIsNotVisibleOnLoadOfViewController() {
        
        XCTAssertEqual(placeListVC.invalidInputLabel.alpha, 0)
    }
    
    private func makePlacesListViewController() -> PlacesListViewController {
        let placeListVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlacesListViewController") as PlacesListViewController
        placeListVC.loadViewIfNeeded()
        return placeListVC
    }
}
