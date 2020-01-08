//
//  PreferencesManager.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

enum PreferencesManager: String {
    case currentCurrency
    
    func setValue<T>(value: T) {
        UserDefaults.standard.set(value, forKey: rawValue)
    }
    
    func getValue<T>() -> T? {
        return UserDefaults.standard.object(forKey: rawValue) as? T
    }
}
