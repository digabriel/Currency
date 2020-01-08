//
//  CurrencyRateViewModel.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

struct CurrencyRateViewModel {
    private let rate: CurrencyRate
    
    init(rate: CurrencyRate) {
        self.rate = rate
    }
    
    var symbol: String {
        return rate.currency.symbol
    }
    
    var rateValue: String {
        return String(format: "%.2f", rate.rate)
    }
    
    var flagImageName: String {
        return symbol.lowercased()
    }
}
