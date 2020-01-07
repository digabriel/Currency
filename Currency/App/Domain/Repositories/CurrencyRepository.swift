//
//  CurrencyRepository.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift

protocol CurrencyRepository {
    func fetchCurrencyRates(baseCurrency: Currency) -> Single<[CurrencyRate]>
    func convertAmount(from fCurrency: Currency, to tCurrency: Currency, amount: Double) -> Single<CurrencyRate>
}
