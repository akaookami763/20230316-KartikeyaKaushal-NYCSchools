//
//  APIClientTests.swift
//  NYC YouthsTests
//
//  Created by Kartikeya Kaushal on 3/20/23.
//

import NYC_Youths
import XCTest
import Combine

class APIClientTests: XCTestCase {
    private var cancellables: Set<AnyCancellable>!
    
    private var apiClient: APIClient!
    let mockRequest = URLRequest(url: URL(string: "www.google.com")!)
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func testSuccess() {
        self.apiClient = setupClient(data: Data(base64Encoded: "Success"), statusCode: 200, error: nil)
        
        let future: Future<String, Error> = apiClient.run(mockRequest)
    }
    
    func testStatusCodeFailures() {
        self.apiClient = setupClient(data: Data(base64Encoded: "Bad Setup Failure"), statusCode: 400, error: NSError(domain: "Bad Request Failure", code: 400, userInfo: nil))
        
        let future: Future<String, Error> = apiClient.run(mockRequest)
    }
    
    
    private func setupClient(data: Data?, statusCode: Int, error: Error?) -> APIClient {
        let mockSession = MockURLSession(data: data, responseCode: statusCode, error: error)
        
        return APIClient(network: mockSession)
    }
    
    
    
}//end APIClientTests

