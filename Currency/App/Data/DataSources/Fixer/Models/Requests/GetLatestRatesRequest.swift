//
//  GetLatestRatesRequest.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

struct GetLatestRatesRequest: Encodable {
    let accessKey: String
    let baseCurrencySymbol: String
    
    enum CodingKeys: String, CodingKey {
        case accessKey = "access_key"
        case baseCurrencySymbol = "base"
    }
}
