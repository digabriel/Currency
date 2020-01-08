//
//  Repositories+Injection.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerRepositories() {
        #if MOCK
            register { CurrencyRepositoryMock() }
                .implements(CurrencyRepository.self)
                .scope(application)
        #else
            register { CurrencyRepositoryRemote() }
                .implements(CurrencyRepository.self)
                .scope(application)
        #endif
    }
}
