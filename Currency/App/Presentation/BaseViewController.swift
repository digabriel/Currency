//
//  BaseViewController.swift
//  CurrencyConverter
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import UIKit

class BaseViewController<VM>: UIViewController where VM: BaseViewModel {
    let viewModel: VM!
    
    init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
