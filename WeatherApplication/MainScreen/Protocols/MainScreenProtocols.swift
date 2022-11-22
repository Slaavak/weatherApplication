//
//  MainScreenProtocols.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

protocol MainScreenViewControllerInput: AnyObject {
    func setViewModel(_ model: MainScreenViewModel)
}

protocol MainScreenViewControllerOutput {
    func prepareData()
}
