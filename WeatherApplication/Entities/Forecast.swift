//
//  Forecast.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import Foundation

public struct Forecast: Codable {
    var date: String
    var min_temperature: Int
    var max_temperature: Int
    var weather_type: WeatherType
}
