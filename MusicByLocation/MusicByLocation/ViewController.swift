//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Vlasto, Benedict (JDN) on 25/02/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()

    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        getArtists()
        
    }
    
    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                } else {
                    self.musicRecommendations.text = """
                    Country: \(placemarks?[0].country ?? "Unable to locate country")
                    City: \(placemarks?[0].locality ?? "Unable to locate city")
                    Street: \(placemarks?[0].thoroughfare ?? "Unable to locate street")
                    """
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Couldn't access user's location. Error: \(error.localizedDescription)"
    }
    
    func getArtists() -> String {
        guard let url = URL(string: "https://itunes.apple.com/search?term=Lionel%20Richie&entity=musicArtist")
            else {
                print("Invalid URL")
                return("Invalid URL: wasn't able to search Itunes")
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                print(String(decoding: data, as: UTF8.self))
            }
        }.resume()
        
        return("")
    }

    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }

    }
    
}
