//
//  ClimaViewController.swift
//  SunRain
//
//  Created by Bruno Alves on 26/01/21.
//

import UIKit
import CoreLocation

class ClimaViewControler: UIViewController {
    
    @IBOutlet weak var climaImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var sunrainManager = SunRainManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        searchTextField.delegate = self
        sunrainManager.delegate = self
    }
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
}
//MARK: - UITextFieldDelegate

extension ClimaViewControler: UITextFieldDelegate{
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Digite alguma cidade"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            sunrainManager.weatherLive(cityName: city)
        }
        searchTextField.text = ""
    }
}
//MARK: - SunRainManagerDelegate

extension ClimaViewControler: SunRainManagerDelegate{
    
    func didUpdateWeather(_ sunrainManager: SunRainManager ,weather: SunRainModel){ DispatchQueue.main.async {
        self.temperatureLabel.text = weather.temperatureString
        self.climaImageView.image = UIImage(systemName: weather.conditionName)
        self.view.backgroundColor = weather.conditionbackColor
        self.climaImageView.tintColor = weather.conditionimgColor
        self.cityLabel.text = weather.cityName
    }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension ClimaViewControler: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            sunrainManager.weatherLive(latitude: lat, longitude: lon)

        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
