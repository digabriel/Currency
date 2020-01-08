//
//  BaseViewModel.swift
//  CurrencyConverter
//
//  Created by Dimas Gabriel on 07/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift

// Classes that all view models will inherit. This can containt shared infos and logic used by all View Models
class BaseViewModel {
    let loading = PublishSubject<Bool>()
    
    func loadingBound<T>(_ single: Single<T>) -> Single<T> {
        return single.do(onSuccess: {[weak self]_ in self?.loading.onNext(false)},
                         onError: {[weak self]_ in self?.loading.onNext(false) },
                         onSubscribe: {[weak self] in self?.loading.onNext(true)})
    }
    
    func didBind() {
        
    }
}
