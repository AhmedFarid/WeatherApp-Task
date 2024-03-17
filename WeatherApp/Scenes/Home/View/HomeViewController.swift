//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import UIKit
import CoreLocation

class HomeViewController: UITableViewController {

    var presenter: HomePresenterProtocol!
    var locManager = CLLocationManager()
    var currentUserLocation: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registerTableViewCells()
        setnavigationTitle()
        getUserLocation()
        presenter.viewDidLoad()
    }

    func setnavigationTitle() {
        title = "Home"
    }
}

