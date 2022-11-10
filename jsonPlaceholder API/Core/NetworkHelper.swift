//
//  NetworkHelper.swift
//  jsonPlaceholder API
//
//  Created by can on 7.11.2022.
//  Copyright © 2022 can. All rights reserved.
//

import Foundation
enum HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}
class NetworkHelper {
    static let shared = NetworkHelper()
    let baseURL = "https://jsonplaceholder.typicode.com/"


}
