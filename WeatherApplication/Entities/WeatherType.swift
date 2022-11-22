//
//  WeatherType.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import UIKit

public enum WeatherType: String, Codable {
    case snow = "snow"
    case cloud = "cloud"
    case sun = "sun"
    
    public func getIcon() -> UIImage {
        let value = WeatherType(rawValue: rawValue)
        switch value {
        case .snow:
            return UIImage(named: "WeatherSnow")!
            
        case .cloud:
            return UIImage(named: "WeatherCloud")!
            
        case .sun:
            return UIImage(named: "WeatherSun")!
            
        case .none:
            return UIImage(named: "WeatherEmpty")!
            
        }
    }
}
