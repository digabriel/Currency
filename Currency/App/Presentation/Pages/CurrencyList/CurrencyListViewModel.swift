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
    private let defaultCurrency = Currency(symbol: "USD")
    
    let baseCurrency = PublishRelay<Currency>()
    let currencyList: Driver<[CurrencyRate]>

    override init() {
        currencyList = baseCurrency.flatMapLatest { currency in
            return GetCurrencyRates(baseCurrency: currency).execute()
        }
        .asDriver(onErrorJustReturn: []) //TODO: Handle the error here
        
        super.init()
    }
    
    func setup() {
        baseCurrency.accept(defaultCurrency)
    }
}
