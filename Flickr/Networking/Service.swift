//
//  Service.swift
//  Flickr
//
//  Created by Dheeraj Jha on 27/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation

public enum HTTPMethod : String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case patch  = "PATCH"
    case delete = "DELETE"
}

public enum HTTPTask {
    case request
    
}

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

public enum HTTPTask {
    case request
    case requestParametersAndHeaders(bodyParameters: Parameters?,
    urlParameters Parameters?,
        additionHeaders: HTTPHeaders?)
}
