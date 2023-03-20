//
//  APIClient.swift
//  NYC Youths
//
//  Created by Kartikeya Kaushal on 3/15/23.
//

import Foundation
import Combine

struct APIClient {
    private var network: URLSessionProtocol
    
    init(network: URLSessionProtocol = URLSession.shared) {
        self.network = network
    }
    
//    //The response information and data parsed as its data type
//    struct Response<T> {
//        let data: T
//        let response: URLResponse?
//    }
    
    func run<T: Decodable>(_ request: URLRequest) -> Future<T, Error> {
        return Future { promise in
            let task = self.network.requestDataTask(with: request) {data, response, error in
                //Network call error scenario
                if let err = error {
                    promise(.failure(err))
                }
                //API Failure or unexpected response code
                else if let res = response as? HTTPURLResponse {
                    if res.statusCode >= 300 {
                        let error = NSError(domain: "API Failure", code: res.statusCode, userInfo: nil)
                        promise(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "Response Parse Failure", code: -1, userInfo: nil)
                    promise(.failure(error))
                }
                
                //Success
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        promise(.success(decodedData))
                    } catch {
                        let error = NSError(domain: "Data Decode Failure", code: -1, userInfo: nil)
                        promise(.failure(error))
                        
                    }
                }
                else {
                    let error = NSError(domain: "No Data Found", code: -1, userInfo: nil)
                    promise(.failure(error))
                }
                
                
            }//end task definition
            task.resume()
        }//end Future
    }
}
