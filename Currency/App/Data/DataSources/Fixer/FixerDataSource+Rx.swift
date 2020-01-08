//
//  FixerDataSource+Rx.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

extension FixerDataSource {
    var rxSingleData: Single<AFDataResponse<Data?>> {
        return Single.create { single in
            let call = self.responseData { response in
                if let error = response.error {
                    single(.error(CurrencyError.dataSources(baseError: error)))
                } else {
                    single(.success(response))
                }
            }
            
            return Disposables.create {
                call.cancel()
            }
        }
        .catchError { error in
            return Single.error(CurrencyError.dataSources(baseError: error))
        }
    
    }
}

extension Single where Element == AFDataResponse<Data?>, Trait == SingleTrait {
    func mapObject<T: Codable>(type: T.Type) -> Single<T> where T: FixerResponse {
        return map { response in
            guard let data = response.data else {
                throw CurrencyError.unknown //TODO: Handle with a proper error
            }
            
            let decoder = JSONDecoder()
            let parsedResponse = try decoder.decode(T.self, from: data)
            
            if parsedResponse.isSuccess {
                return parsedResponse
            } else {
                throw CurrencyError.unknown //TODO: Handle proper error
            }
        }
    }
    
    func mapArray<T: Codable>(type: T.Type) -> Single<[T]> {
        return map { response in
            guard let data = response.data else {
                throw CurrencyError.unknown //TODO: Handle proper error
            }
            
            let decoder = JSONDecoder()
            return try decoder.decode([T].self, from: data)
        }
    }
}
