//
//  CurrencyRateTableViewCell.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import UIKit

class CurrencyRateTableViewCell: UITableViewCell {
    static let identifier = "CurrencyRateTableViewCell"
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    
    func bindViewModel(_ viewModel: CurrencyRateViewModel) {
        currencyLabel.text = viewModel.symbol
        rateLabel.text = viewModel.formattedRateValue
        iconImageView.image = UIImage(named: viewModel.flagImageName)
    }
}
