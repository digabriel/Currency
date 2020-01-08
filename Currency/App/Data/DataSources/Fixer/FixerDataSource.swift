//
//  FixerDataSource.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation
import Alamofire

enum FixerDataSource: URLRequestConvertible {
    static let baseUrlString = "http://data.fixer.io/api"
    static let accessKey = "e1483f35e6bc0da8680924c7fab75028"
    
    case getLatestRates(request: GetLatestRatesRequest)
    
    var method: HTTPMethod {
        switch self {
        case .getLatestRates:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getLatestRates:
            return "/latest"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseUrl = try FixerDataSource.baseUrlString.asURL()
        var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path))
        
        switch self {
        case .getLatestRates(let requestBody):
            urlRequest = try URLEncodedFormParameterEncoder().encode(requestBody, into: urlRequest)
        }
        
        return urlRequest
    }
    
    func responseData(completion: @escaping (AFDataResponse<Data?>) -> Void) -> DataRequest {
        logRequest(self.urlRequest)
        
        return AF.request(self)
            .validate()
            .response { afResponse in
                self.logResponse(afResponse.response, bodyData: afResponse.data)
                completion(afResponse)
        }
    }
}
