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
    
    lazy var currencyList: Driver<[CurrencyRateViewModel]> = {
        return baseCurrency.flatMapLatest { currency in
            return self.loadingBound(GetCurrencyRates(baseCurrency: currency)
                .execute()
                .map { ratesList in
                    ratesList.map { CurrencyRateViewModel(rate: $0) }
                })
                
        }
        .asDriver(onErrorJustReturn: []) //TODO: Handle the error here
    }()
    
    override func didBind() {
        super.didBind()
        baseCurrency.accept(defaultCurrency)
    }
}
