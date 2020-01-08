//
//  CurrencyRate.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

struct CurrencyRate {
    let currency: Currency
    let rate: Double
}

extension CurrencyRate: Comparable {
    static func < (lhs: CurrencyRate, rhs: CurrencyRate) -> Bool {
        return lhs.currency < rhs.currency
    }
}
