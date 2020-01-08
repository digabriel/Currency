//
//  CurrencyRepositoryMock.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift

class CurrencyRepositoryMock: CurrencyRepository {
    func fetchCurrencyRates(baseCurrency: Currency) -> Single<[CurrencyRate]> {
        return Single.just([
            CurrencyRate(currency: Currency(symbol: "USD"), rate: 1.0),
            CurrencyRate(currency: Currency(symbol: "BRL"), rate: 1.2),
            CurrencyRate(currency: Currency(symbol: "EUR"), rate: 0.775),
            CurrencyRate(currency: Currency(symbol: "USD"), rate: 10.34)
        ])
    }
    
    func convertAmount(from fCurrency: Currency, to tCurrency: Currency, amount: Double) -> Single<CurrencyRate> {
        return Single.just(CurrencyRate(currency: Currency(symbol: "USD"), rate: 1.0))
    }
}
