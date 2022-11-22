//
//  MainScreenViewController.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import UIKit

class MainScreenViewController: UIViewController {

    //MARK: - Outlets

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var todayWeatherView: UIView!
    @IBOutlet weak var todayWeatherCollectionView: UICollectionView!
    @IBOutlet weak var todayWeatherLabel: UILabel!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var forecatsTableView: UITableView!

    //MARK: - Properties

    var output: MainScreenViewControllerOutput!
    private var todayForecast: [TimeforecastModel] = []
    private var forecast: [DayForcastModel] = []

    //MARK: - Lyfe cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output.prepareData()
        configureUI()
        tableViewConfigure()
        collectionViewConfigure()
    }

    //MARK: - Actions

    private func configureUI() {
        view.layer.contents = UIImage(named: Constants.backgroundImageName)!.cgImage

        todayWeatherView.layer.cornerRadius = Constants.todayWeatherViewCornerRadius
        todayWeatherView.layer.masksToBounds = true
        todayWeatherView.contentMode = .scaleToFill

    }

    private func tableViewConfigure() {
        forecatsTableView.delegate = self
        forecatsTableView.dataSource = self
        forecatsTableView.register(UINib(nibName: Constants.forecastTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.forecastTableViewCell)
        forecatsTableView.register(UINib(nibName: Constants.forecastHeaderView, bundle: nil), forHeaderFooterViewReuseIdentifier: Constants.forecastHeaderView)
        forecatsTableView.layer.cornerRadius = Constants.forecatsTableViewCornerRadius
        forecatsTableView.layer.masksToBounds = true
    }

    private func collectionViewConfigure() {
        todayWeatherCollectionView.delegate = self
        todayWeatherCollectionView.dataSource = self
        todayWeatherCollectionView.register(UINib(nibName: Constants.todayForecastCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.todayForecastCollectionViewCell)
        todayWeatherCollectionView.contentInset = Constants.todayWeatherCollectionViewInsets
        if let layout = todayWeatherCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

    private enum Constants {
        static let forecastTableViewCell = "ForecastTableViewCell"
        static let forecastHeaderView = "ForecastHeaderView"
        static let todayForecastCollectionViewCell = "TodayForecastCollectionViewCell"
        static let forecatsTableViewCornerRadius: CGFloat = 14
        static let todayWeatherViewCornerRadius: CGFloat = 14
        static let backgroundImageName = "background.jpg"
        static let heightForHeader: CGFloat = 45
        static let todayWeatherCollectionViewInsets = UIEdgeInsets(
            top: 0,
            left: 7,
            bottom: 0,
            right: 7
        )
    }
}

//MARK: - MainScreenViewControllerInput
extension MainScreenViewController: MainScreenViewControllerInput {

    func setViewModel(_ model: MainScreenViewModel) {
        self.cityLabel.text = model.cityLabelText
        self.todayWeatherLabel.text = model.todayWeatherDescriptionLabelText
        self.currentWeatherLabel.text = model.currentWeatherLabelText
        self.todayForecast = model.todayForecast
        self.forecast = model.daysForecast
        self.forecatsTableView.reloadData()
        self.todayWeatherCollectionView.reloadData()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forecast.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = forecatsTableView.dequeueReusableCell(withIdentifier: Constants.forecastTableViewCell, for: indexPath) as? ForecastTableViewCell
        cell?.updateWithModel(model: forecast[indexPath.row])
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = self.forecatsTableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.forecastHeaderView)  as! ForecastHeaderView

        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.heightForHeader
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.todayForecast.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = todayWeatherCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.todayForecastCollectionViewCell, for: indexPath) as? TodayForecastCollectionViewCell
        cell?.updateWithModel(model: todayForecast[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}
