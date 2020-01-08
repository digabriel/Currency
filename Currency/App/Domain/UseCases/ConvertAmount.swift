//
//  ConvertAmount.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift
import Resolver

struct ConvertAmount {
    private let fromCurrency: Currency
    private let toCurrency: Currency
    private let amount: Double
    
    @Injected private var currencyRepository: CurrencyRepository
    
    func execute() -> Single<CurrencyRate> {
        let repositoryCall = currencyRepository.convertAmount(from: fromCurrency, to: toCurrency, amount: amount)
        return validate().andThen(repositoryCall)
    }
    
    private func validate() -> Completable {
        if amount <= 0 {
            let error = CurrencyError.validation(message: "Invalid currency amount")
            return Completable.error(error)
        }
        
        return Completable.empty()
    }
}
