//
//  CurrencyListViewModel.swift
//  CurrencyConverter
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CurrencyListViewModel: BaseViewModel {
    private let defaultCurrency: Currency = Currency(symbol: PreferencesManager.currentCurrency.getValue() ?? "USD")
    
    let supportedCurrencies = ["USD", "EUR", "BRL"]
    let baseCurrency: BehaviorRelay<Currency>
    let refresh: AnyObserver<Void>
    let baseCurrencyIndex = BehaviorRelay<Int>(value: 0)
    
    private let disposeBag = DisposeBag()
    
    lazy var currencyList: Driver<[CurrencyRateViewModel]> = {
        return baseCurrency.flatMap { [unowned self] currency in
            return self.loadingBound(GetCurrencyRates(baseCurrency: currency)
                .execute()
                .map { ratesList in
                    ratesList.map { CurrencyRateViewModel(rate: $0) }
                })
        }
        .asDriver(onErrorJustReturn: []) //TODO: Handle the error here
    }()
    
    override init() {
        baseCurrency = BehaviorRelay(value: defaultCurrency)
        
        let refreshPs = PublishSubject<Void>()
        refresh = refreshPs.asObserver()
        
        super.init()
        
        refreshPs.subscribe(onNext: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.baseCurrency.accept(weakSelf.baseCurrency.value)
        })
        .disposed(by: disposeBag)
        
        baseCurrency.map { [unowned self] currency in
            self.saveCurrentCurrency(currency)
            return self.indexOfBaseCurrency(symbol: currency.symbol) ?? 0
        }
        .bind(to: baseCurrencyIndex)
        .disposed(by: disposeBag)
    }
    
    func buildConverterViewModel(rateViewModel: CurrencyRateViewModel) -> CurrencyConverterViewModel{
        return CurrencyConverterViewModel(fromCurrency: baseCurrency.value,
                                          toCurrency: rateViewModel.currency,
                                          rateValue: rateViewModel.rateValue)
    }
    
    private func saveCurrentCurrency(_ currency: Currency) {
        PreferencesManager.currentCurrency.setValue(value: currency.symbol)
    }
    
    func indexOfBaseCurrency(symbol: String) -> Int? {
        return supportedCurrencies.firstIndex(of: symbol)
    }
    
    func setBaseCurrencyAtIndex(_ index: Int) {
        guard index < supportedCurrencies.count else { return }
        baseCurrency.accept(Currency(symbol: supportedCurrencies[index]))
    }
}
