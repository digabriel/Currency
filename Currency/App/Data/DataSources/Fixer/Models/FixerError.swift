//
//  FixerErrorResponse.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

class FixerError: Error, Codable {
    let code: Int
    let info: String
}
