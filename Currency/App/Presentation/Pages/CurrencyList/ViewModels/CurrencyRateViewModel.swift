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
    
    var currency: Currency {
        return rate.currency
    }
    
    var symbol: String {
        return rate.currency.symbol.uppercased()
    }
    
    var formattedRateValue: String {
        return String(format: "%.2f", rate.rate)
    }
    
    var rateValue: Double {
        return rate.rate
    }
    
    var flagImageName: String {
        return symbol.lowercased()
    }
}
