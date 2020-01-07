//
//  GetCurrencyList.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift

struct GetCurrencyRates {
    private let baseCurrency: Currency
    
    func execute() -> Single<[CurrencyRate]> {
        return Single.just([])
    }
}
