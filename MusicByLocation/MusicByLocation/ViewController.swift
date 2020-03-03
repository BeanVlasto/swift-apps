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
                    let searchTerm = placemarks?[0].locality ?? "None"
                    if let firstWord = searchTerm.components(separatedBy: " ").first {
                        self.musicRecommendations.text = self.getArtists(searchTerm: firstWord)
                    }
                        
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Couldn't access user's location. Error: \(error.localizedDescription)"
    }
    
    func getArtists(searchTerm: String) -> String {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=musicArtist")
            else {
                print("Invalid URL")
                return("Invalid URL: wasn't able to search Itunes")
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator: ", ")
                    }
                    
                }
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
