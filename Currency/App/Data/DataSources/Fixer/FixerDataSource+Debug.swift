//
//  FixerDataSource+Debug.swift
//  Currency
//
//  Created by Dimas Gabriel on 08/01/20.
//  Copyright © 2020 Dimas Gabriel. All rights reserved.
//

import Foundation

extension FixerDataSource: CustomStringConvertible {
    var debugURL: String {
        do {
            return "\(method.rawValue) \(try asURLRequest().url?.absoluteString ?? "")"
        } catch {
            return "FixerDataSource: Invalid request to \(path)"
        }
    }
    
    var description: String {
        return debugURL
    }
    
    func logRequest(_ request: URLRequest?) {
        #if DEBUG
        guard let request = request else { return }
        
        print("")
        print("------------ REQUEST -----------")
        print("URL: \(debugURL)")
        print("HEADERS: \(request.allHTTPHeaderFields ?? [:])")
        
        if let data = request.httpBody {
            let body = String(data: data, encoding: .utf8)
            print("BODY: \(body ?? "")")
        }
        print("-------- REQUEST FINISH --------")
        print("")
        #endif
    }
    
    func logResponse(_ response: HTTPURLResponse?, bodyData: Data?) {
        #if DEBUG
        guard let response = response else { return }
        
        print("")
        print("------------ RESPONSE -----------")
        print("URL: \(response.statusCode) - \(response.url?.absoluteString ?? "")")
        print("HEADERS: \(response.headers.dictionary)")
        if let data = bodyData {
            print("BODY: \(data.prettyPrintedJSONString ?? "")")
        }
        print("-------- RESPONSE FINISH --------")
        print("")
        #endif
    }
}
