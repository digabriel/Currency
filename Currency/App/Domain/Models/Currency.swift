//
//  Currency.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

struct Currency {
    let symbol: String
    let name: String?
    let imageUrl: String?
    
    init(symbol: String, name: String? = nil, imageUrl: String? = nil) {
        self.symbol = symbol
        self.name = name
        self.imageUrl = imageUrl
    }
}
