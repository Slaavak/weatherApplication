//
//  MainScreenPresenter.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import UIKit

class MainScreenPresenter: MainScreenViewControllerOutput {

    //MARK: - Properties

    weak var view: MainScreenViewControllerInput!
    var service: MainScreenService!

    //MARK: - Actions

    func prepareData() {
        service.getData(complition: { [weak self] response in
            guard let self else {
                return
            }
            let cityLabelText = response.city
            let currentWeatherLabelText = response.temperature
            let todayWeatherDescriptionLabelText = response.description
            var todayForecast: [TimeforecastModel] = []
            var daysForecast: [DayForcastModel] = []

            for el in response.weather_per_day {
                if let sunset = el.sunset, sunset == true {
                    todayForecast.append(
                        TimeforecastModel(
                            time: el.timestamp,
                            image: UIImage(named: Constants.sunset)!,
                            temperature: Strings.sunset,
                            sunset: true
                        )
                    )
                } else {
                    todayForecast.append(
                        TimeforecastModel(
                            time: el.timestamp,
                            image: el.weather_type.getIcon(),
                            temperature: el.temperature + Strings.celsius
                        )
                    )
                }
            }

            for el in response.forecast {
                daysForecast.append(
                    DayForcastModel(
                        day: self.getDayOfWeekString(el.date),
                        image: el.weather_type.getIcon(),
                        temperatureMax: String(el.max_temperature) + Strings.celsius,
                        temperatureMin: String(el.min_temperature) + Strings.celsius
                    )
                )
            }


            let model = MainScreenViewModel(
                cityLabelText: cityLabelText,
                currentWeatherLabelText: currentWeatherLabelText,
                todayWeatherDescriptionLabelText: todayWeatherDescriptionLabelText,
                todayForecast: todayForecast,
                daysForecast: daysForecast
            )
            self.view.setViewModel(model)
        })
    }

    //MARK: - Private actions
    
    private func getDayOfWeekString(_ today: String) -> String {
        let formatter  = DateFormatter()
        formatter.dateFormat = Constants.dateFormat
        if let todayDate = formatter.date(from: today) {
            let myCalendar = NSCalendar(calendarIdentifier: .gregorian)!
            let myComponents = myCalendar.components(.weekday, from: todayDate)
            let weekDay = myComponents.weekday
            if Calendar.current.isDateInToday(todayDate) {
                return Strings.Forecast.today
            }

            switch weekDay {
            case 1:
                return Strings.Forecast.sunday
            case 2:
                return Strings.Forecast.monday
            case 3:
                return Strings.Forecast.tuesday
            case 4:
                return Strings.Forecast.wednesday
            case 5:
                return Strings.Forecast.thursday
            case 6:
                return Strings.Forecast.friday
            case 7:
                return Strings.Forecast.saturday
            default:
                return Strings.Forecast.defaultValue
            }
        } else {
            return Strings.Forecast.nilValue
        }
    }

    private enum Constants {
        static let dateFormat = "dd.MM.yyyy"
        static let sunset = "sunset"
    }
}
