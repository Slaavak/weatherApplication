//
//  WeatherResponse.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import Foundation

public struct WeatherResponse: Codable {
    var city: String
    var temperature: String
    var description: String
    var weather_per_day: [WeatherPerDay]
    var forecast: [Forecast]
}
