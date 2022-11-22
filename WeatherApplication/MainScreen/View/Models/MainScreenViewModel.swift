//
//  MainScreenViewModel.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

public class MainScreenViewModel {
    var cityLabelText: String
    var currentWeatherLabelText: String
    var todayWeatherDescriptionLabelText: String
    var todayForecast: [TimeforecastModel]
    var daysForecast: [DayForcastModel]

    init(
        cityLabelText: String,
        currentWeatherLabelText: String,
        todayWeatherDescriptionLabelText: String,
        todayForecast: [TimeforecastModel],
        daysForecast: [DayForcastModel]
    ) {
        self.cityLabelText = cityLabelText
        self.currentWeatherLabelText = currentWeatherLabelText
        self.todayWeatherDescriptionLabelText = todayWeatherDescriptionLabelText
        self.todayForecast = todayForecast
        self.daysForecast = daysForecast
    }
}
