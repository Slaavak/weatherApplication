//
//  DayForcastModel.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 22.11.22.
//

import UIKit

public class DayForcastModel {
    var day: String
    var image: UIImage
    var temperatureMax: String
    var temperatureMin: String

    init(
        day: String,
        image: UIImage,
        temperatureMax: String,
        temperatureMin: String
    ) {
        self.day = day
        self.image = image
        self.temperatureMax = temperatureMax
        self.temperatureMin = temperatureMin
    }
}
