//
//  MainScreenService.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import Foundation

protocol MainScreenService {
    func getData(complition: @escaping (WeatherResponse) -> Void)
}

class MainScreenServiceImp: MainScreenService {

    func getData(complition: @escaping (WeatherResponse) -> Void) {
        DispatchQueue.global().async {
            if let url = Bundle.main.url(forResource: Constants.fileName, withExtension: Constants.fileExtension) {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(WeatherResponse.self, from: data)
                    DispatchQueue.main.async {
                        complition(jsonData)
                    }
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }

    private enum Constants {
        static let fileName = "TestTaskJSON"
        static let fileExtension = "json"
    }
}
