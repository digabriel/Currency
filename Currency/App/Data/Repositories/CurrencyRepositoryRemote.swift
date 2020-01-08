
//
//  CurrencyRepository.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift

class CurrencyRepositoryRemote: CurrencyRepository {
    func fetchCurrencyRates(baseCurrency: Currency) -> Single<[CurrencyRate]> {
        let request = GetLatestRatesRequest(accessKey: FixerDataSource.accessKey,
                                            baseCurrencySymbol: baseCurrency.symbol)
        
        return FixerDataSource.getLatestRates(request: request)
            .rxSingleData
            .mapObject(type: GetLatestRatesResponse.self)
            .map { CurrencyRate.fromLatestRatesResponse($0) }
    }
    
    func convertAmount(from fCurrency: Currency, to tCurrency: Currency, amount: Double) -> Single<CurrencyRate> {
        return Single.just(CurrencyRate(currency: Currency(symbol: "USD"), rate: 1.0))
    }
}
