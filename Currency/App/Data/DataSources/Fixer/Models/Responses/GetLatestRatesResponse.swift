//
//  GetLatestRatesResponse.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

struct GetLatestRatesResponse: Codable, FixerResponse {    
    let isSuccess: Bool
    let baseCurrencySymbol: String
    let rates: [String:Double]
    let error: FixerError?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "success"
        case baseCurrencySymbol = "base"
        case rates = "rates"
        case error = "error"
    }
}
