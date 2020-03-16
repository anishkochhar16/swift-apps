//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Anish Kochhar on 26/02/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let itunesAdapter = ITunesAdapter()
    let locationManagerDelegate = LocationManagerDelegate()
    
    @IBOutlet weak var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = locationManagerDelegate
        locationManagerDelegate.vc = self
    }

    func updateDisplay(text: String?) {
        musicRecommendations.text = text
    }
    
    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func updateArtistsByLocation(text: String?) {
        itunesAdapter.getArtists(search: text) { (artists) in
            let names = artists?.map { return $0.artistName }
            self.musicRecommendations.text = names?.joined(separator: ", ")
        }
    }
}

