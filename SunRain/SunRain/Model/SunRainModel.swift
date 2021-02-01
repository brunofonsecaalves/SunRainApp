//
//  SunRainModel.swift
//  SunRain
//
//  Created by Bruno Alves on 26/01/21.
//

import Foundation
import UIKit
struct SunRainModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String{
        return String(format: "%.0f", temperature)
    }
    var conditionbackColor: UIColor{
        switch conditionID {
        case 200...232:
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case 300...321:
            return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        case 500...531:
            return#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        case 600...622:
            return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        case 700...781:
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case 800:
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case 801...804:
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        default:
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    var conditionimgColor: UIColor{
        switch conditionID {
        case 200...232:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case 300...321:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case 500...531:
            return#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case 600...622:
            return #colorLiteral(red: 0.4691522742, green: 0.8867147413, blue: 1, alpha: 1)
        case 700...781:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case 800:
            return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case 801...804:
            return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        default:
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    var conditionName: String{
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.flog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
