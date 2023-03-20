//
//  MockURLSession.swift
//  NYC YouthsTests
//
//  Created by Kartikeya Kaushal on 3/20/23.
//

@testable import NYC_Youths
import Foundation

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    typealias CompletionHandler = MockURLSession.CompletionHandler
    
    private let completion: CompletionHandler
    
    init(completion: @escaping CompletionHandler) {
        self.completion = completion
    }
    
    func resume() {
        // create some data
        completion(nil, nil, nil)
    }
}//end MockURLSessionDataTask

class MockURLSession: URLSessionProtocol {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    // data and error can be set to provide data or an error
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    
    init(data: Data?, responseCode: Int, error: Error?) {
        self.data = data
        self.response = HTTPURLResponse(url: URL(string: "www.google.com")!, statusCode: responseCode, httpVersion: "1.1", headerFields: nil)
        self.error = error
    }
    
    func requestDataTask(with: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return MockURLSessionDataTask(completion: completionHandler)
    }
    
}//end MockURLSession
