//
//  ForecastTableViewCell.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    //MARK: - Properties

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    //MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
    }

    //MARK: - Actions

    public func updateWithModel(model: DayForcastModel) {
        self.dayLabel.text = model.day
        self.minTemperatureLabel.text = String(model.temperatureMin)
        self.maxTemperatureLabel.text = String(model.temperatureMax)

        self.iconImageView.image = model.image
    }
}
