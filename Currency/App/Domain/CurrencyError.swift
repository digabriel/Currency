//
//  CurrencyError.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

enum CurrencyError: Error {
    case validation(message: String)
    case unknown
}
