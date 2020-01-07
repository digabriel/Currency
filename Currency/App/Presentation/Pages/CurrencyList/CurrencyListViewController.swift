//
//  CurrencyListViewController.swift
//  CurrencyConverter
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import UIKit

class CurrencyListViewController: BaseViewController<CurrencyListViewModel> {
    override init(viewModel: CurrencyListViewModel = CurrencyListViewModel()) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
