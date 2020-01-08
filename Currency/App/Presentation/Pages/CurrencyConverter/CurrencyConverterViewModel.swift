//
//  CurrencyConverterViewModel.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CurrencyConverterViewModel: BaseViewModel {
    private let fromCurrency: Currency //TODO: This could be a CurrencyViewModel, to share logic (eg. formattedRate)
    private let toCurrency: Currency
    private let rateValue: Double
    
    let convertedAmount: Driver<String>
    let baseAmount: AnyObserver<Double>
    
    init(fromCurrency: Currency, toCurrency: Currency, rateValue: Double) {
        self.fromCurrency = fromCurrency
        self.toCurrency = toCurrency
        self.rateValue = rateValue
        
        let amountPS = PublishSubject<Double>()
        baseAmount = amountPS.asObserver()
        
        convertedAmount = amountPS.map({ originalAmount in
            let convertedValue = originalAmount * rateValue
            return String(format: "%.2f", convertedValue)
        })
        .asDriver(onErrorJustReturn: "")
    }
    
    var title: String {
        "\(fromCurrency.symbol.uppercased()) -> \(toCurrency.symbol.uppercased())"
    }
    
    var formatedRate: String {
        return String(format: "%.2f", rateValue)
    }
    
    var fromCurrencySymbol: String {
        return fromCurrency.symbol
    }
    
    var toCurrencySymbol: String {
        return toCurrency.symbol
    }
}
