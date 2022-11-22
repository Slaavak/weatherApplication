//
//  WeatherPerDay.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import Foundation

public struct WeatherPerDay: Codable {
    var timestamp: String
    var sunset: Bool?
    var weather_type: WeatherType
    var temperature: String
}
