//
//  CurrencyListViewController.swift
//  CurrencyConverter
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import UIKit
import RxCocoa

class CurrencyListViewController: BaseViewController<CurrencyListViewModel> {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "CurrencyRateTableViewCell", bundle: nil),
                               forCellReuseIdentifier: CurrencyRateTableViewCell.identifier)
            tableView.rowHeight = 44.0
        }
    }
    
    override init(viewModel: CurrencyListViewModel = CurrencyListViewModel()) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func bindViewModel() {
        viewModel.currencyList
            .drive(tableView.rx.items(cellIdentifier: CurrencyRateTableViewCell.identifier,
                                                        cellType: CurrencyRateTableViewCell.self)) {
                (_, rateViewModel, cell) in
                cell.bindViewModel(rateViewModel)
        }
        .disposed(by: disposeBag)
        
        super.bindViewModel()
    }
}
