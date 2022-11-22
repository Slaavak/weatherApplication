//
//  TodayForecastCollectionViewCell.swift
//  weatherApplication
//
//  Created by Slava Korolevich on 21.11.22.
//

import UIKit

class TodayForecastCollectionViewCell: UICollectionViewCell {

    //MARK: - Properties

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!

    //MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    //MARK: - Actions

    public func updateWithModel(model: TimeforecastModel) {
        self.timeLabel.text = model.time
        self.iconImageView.image = model.image
        self.temperatureLabel.text = model.temperature

        if model.sunset {
            self.temperatureLabel.font = UIFont(name: "Regular", size: 28)
        } else {
            self.temperatureLabel.font = UIFont(name: "Regular", size: 16)
        }
    }
}
