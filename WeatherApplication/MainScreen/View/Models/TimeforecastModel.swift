//
//  TimeforecastModel.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 22.11.22.
//

import UIKit

public class TimeforecastModel {
    var time: String
    var image: UIImage
    var temperature: String
    var sunset: Bool

    init(
        time: String,
        image: UIImage,
        temperature: String,
        sunset: Bool = false
    ) {
        self.time = time
        self.image = image
        self.temperature = temperature
        self.sunset = sunset
    }
}
