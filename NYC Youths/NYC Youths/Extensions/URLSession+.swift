//
//  URLSession+.swift
//  NYC Youths
//
//  Created by Kartikeya Kaushal on 3/20/23.
//

import Foundation

protocol URLSessionProtocol {
    func requestDataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func requestDataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler)
    }
}
