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
    private let pullToRefreshView = UIRefreshControl(frame: .zero)
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "CurrencyRateTableViewCell", bundle: nil),
                               forCellReuseIdentifier: CurrencyRateTableViewCell.identifier)
            tableView.rowHeight = 44.0
            tableView.addSubview(pullToRefreshView)
        }
    }
    
    override init(viewModel: CurrencyListViewModel = CurrencyListViewModel()) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let row = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: row, animated: true)
        }
    }
    
    override func bindViewModel() {
        viewModel.loading
            .bind(to: pullToRefreshView.rx.isRefreshing)
            .disposed(by: disposeBag)
        
        pullToRefreshView.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.refresh)
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(CurrencyRateViewModel.self)
            .subscribe(onNext: { [weak self] rateVM in
                self?.navigateToConverter(rateVM: rateVM)
            })
            .disposed(by: disposeBag)
        
        viewModel.currencyList
            .drive(tableView.rx.items(cellIdentifier: CurrencyRateTableViewCell.identifier,
                                                        cellType: CurrencyRateTableViewCell.self)) {
                (_, rateViewModel, cell) in
                cell.bindViewModel(rateViewModel)
        }
        .disposed(by: disposeBag)
        
        super.bindViewModel()
    }
    
    private func navigateToConverter(rateVM: CurrencyRateViewModel) {
        let converterViewModel = viewModel.buildConverterViewModel(rateViewModel: rateVM)
        let vc = CurrencyConverterViewController(viewModel: converterViewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
}
