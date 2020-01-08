//
//  FixerResponse.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

protocol FixerResponse {
    var isSuccess: Bool { get }
    var error: FixerError? { get }
}
