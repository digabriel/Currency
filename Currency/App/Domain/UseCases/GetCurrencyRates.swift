//
//  GetCurrencyList.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift
import Resolver

class GetCurrencyRates {
    private let baseCurrency: Currency
    
    init(baseCurrency: Currency) {
        self.baseCurrency = baseCurrency
    }
    
    @Injected private var currencyRepository: CurrencyRepository
    
    func execute() -> Single<[CurrencyRate]> {
        return currencyRepository.fetchCurrencyRates(baseCurrency: baseCurrency)
    }
}
