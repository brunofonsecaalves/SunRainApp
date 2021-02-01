//
//  SunRainManager.swift
//  SunRain
//
//  Created by Bruno Alves on 26/01/21.
//

import Foundation
import CoreLocation
protocol SunRainManagerDelegate {
    func didUpdateWeather(_ sunrainManager: SunRainManager ,weather: SunRainModel)
    func didFailWithError(error: Error)
}
struct SunRainManager{
    let apiURL = "https://api.openweathermap.org/data/2.5/weather?appid=f326a9c651aab1b49086ed0cb3194e69&units=metric"
    
    var delegate: SunRainManagerDelegate?
    
    func weatherLive(cityName : String){
        let apiURLString = "\(apiURL)&q=\(cityName)"
        performRequest(with: apiURLString)
    }
    func weatherLive(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let apiURLString = "\(apiURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: apiURLString)
    }
    func performRequest(with apiURLString: String){
        
        if let url = URL(string: apiURLString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, reponse, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
            }
            if let safeData = data {
                if let weather = self.parseJSON(safeData){
                    self.delegate?.didUpdateWeather(self,  weather: weather)
                }
                
            }
        }
            task.resume()
        }
    }
    func parseJSON(_ sunRainData: Data) -> SunRainModel? {
        let decoder = JSONDecoder()
        do{
        
           let decodeData = try decoder.decode(SunRainData.self, from: sunRainData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            
            let weather = SunRainModel(conditionID: id, cityName: name, temperature: temp)
            return weather
            
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
