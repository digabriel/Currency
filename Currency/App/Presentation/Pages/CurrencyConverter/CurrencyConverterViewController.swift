//
//  CurrencyConverterViewController.swift
//  Currency
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import UIKit
import StringMasking

class CurrencyConverterViewController: BaseViewController<CurrencyConverterViewModel> {
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var convertedAmountLabel: UILabel!
    @IBOutlet private weak var fromCurrencyLabel: UILabel!
    @IBOutlet private weak var toCurrencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        amountTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        amountTextField.resignFirstResponder()
    }
    
    override func bindViewModel() {
        fromCurrencyLabel.text = viewModel.fromCurrencySymbol
        toCurrencyLabel.text = viewModel.toCurrencySymbol

        amountTextField.rx
            .text
            .map { text in
                guard let text = text, let amountValue = Double(text) else { return 0.0 }
                return amountValue
            }
            .bind(to: viewModel.baseAmount)
            .disposed(by: disposeBag)
        
        viewModel.convertedAmount
            .drive(convertedAmountLabel.rx.text)
            .disposed(by: disposeBag)
        
        super.bindViewModel()
    }
}
