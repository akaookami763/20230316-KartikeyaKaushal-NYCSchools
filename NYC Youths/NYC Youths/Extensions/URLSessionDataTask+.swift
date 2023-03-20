//
//  URLSessionDataTask+.swift
//  NYC Youths
//
//  Created by Kartikeya Kaushal on 3/20/23.
//

import Foundation


protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
