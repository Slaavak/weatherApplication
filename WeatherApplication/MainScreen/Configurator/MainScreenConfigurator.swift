//
//  MainScreenConfigurator.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import Foundation

class MainScreenConfigurator {
    func configureViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? MainScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainScreenViewController) {
        let service = MainScreenServiceImp()
        let presenter = MainScreenPresenter()
        presenter.service = service
        presenter.view = viewController

        viewController.output = presenter
    }
}
