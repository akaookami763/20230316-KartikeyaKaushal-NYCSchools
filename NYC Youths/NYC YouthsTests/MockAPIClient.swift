////
////  MockAPIClient.swift
////  NYC YouthsTests
////
////  Created by Kartikeya Kaushal on 3/15/23.
////
//
//@testable import NYC_Youths
//import Foundation
//
//struct MockAPIClient: APIClient {
//    var isError: Bool
//    var mockErrorMessage: String
//    
//    func run(_ request: URLRequest) -> [[String: String]] {
//        if(!isError) {
//            return [[:]] // TODO: For now we return nothing.  Eventually will improve this mock to return particular data
//        }
//        
//    }
//}
