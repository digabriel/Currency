//
//  CurrencyRate+Fixer.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

extension CurrencyRate {
    static func fromLatestRatesResponse(_ response: GetLatestRatesResponse) -> [CurrencyRate] {
        return response.rates.map { (symbol, rate) in
            return CurrencyRate(currency: Currency(symbol: symbol), rate: rate)
        }
    }
}
