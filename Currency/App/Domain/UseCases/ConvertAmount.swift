//
//  ConvertAmount.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift

struct ConvertAmount {
    private let fromCurrency: Currency
    private let toCurrency: Currency
    private let amount: Double
    
    func execute() -> Single<CurrencyRate> {
        return validate().andThen(Single.just(CurrencyRate(currency: Currency(symbol: "USD"), rate: 1.0)))
    }
    
    private func validate() -> Completable {
        if amount <= 0 {
            let error = CurrencyError.validation(message: "Invalid currency amount")
            return Completable.error(error)
        }
        
        return Completable.empty()
    }
}
