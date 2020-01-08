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
    
    private lazy var currentCurrencyControl: UISegmentedControl = {
        return UISegmentedControl(items: viewModel.supportedCurrencies)
    }()
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "CurrencyRateTableViewCell", bundle: nil),
                               forCellReuseIdentifier: CurrencyRateTableViewCell.identifier)
            tableView.rowHeight = 44.0
            tableView.addSubview(pullToRefreshView)
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCurrencyControl.sizeToFit()
        navigationItem.titleView = currentCurrencyControl
        view.sizeToFit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let row = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: row, animated: true)
        }
    }
    
    //MARK: - ViewModel Binding
    
    override func bindViewModel() {
        bindLoadingEvents()
        bindTableViewEvents()
        bindCurrentCurrencyEvents()
        
        super.bindViewModel()
    }
    
    private func bindLoadingEvents() {
        viewModel.loading
            .bind(to: pullToRefreshView.rx.isRefreshing)
            .disposed(by: disposeBag)
        
        pullToRefreshView.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.refresh)
            .disposed(by: disposeBag)
    }
    
    private func bindTableViewEvents() {
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
    }
    
    private func bindCurrentCurrencyEvents() {
        viewModel.baseCurrencyIndex
            .bind(to: currentCurrencyControl.rx.selectedSegmentIndex)
            .disposed(by: disposeBag)
        
        currentCurrencyControl.addTarget(self, action: #selector(changeBaseCurrency), for: .valueChanged)
    }
    
    //MARK: - Actions
    @objc func changeBaseCurrency() {
        let index = currentCurrencyControl.selectedSegmentIndex
        viewModel.setBaseCurrencyAtIndex(index)
    }
    
    //MARK: - Navigation
    private func navigateToConverter(rateVM: CurrencyRateViewModel) {
        let converterViewModel = viewModel.buildConverterViewModel(rateViewModel: rateVM)
        let vc = CurrencyConverterViewController(viewModel: converterViewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
}
