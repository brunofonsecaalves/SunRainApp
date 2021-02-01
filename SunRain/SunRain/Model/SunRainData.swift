//
//  SunRainData.swift
//  SunRain
//
//  Created by Bruno Alves on 26/01/21.
//

import Foundation

struct SunRainData: Codable {
    let name : String
    let main : Main
    let weather : [Weather]
}
struct Main: Codable {
    let temp: Double
}
struct Weather: Codable {
    let description: String
    let id: Int
}
