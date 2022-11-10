//
//  NetworkManager.swift
//  jsonPlaceholder API
//
//  Created by can on 7.11.2022.
//  Copyright © 2022 can. All rights reserved.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    func fetch<T : Codable>(type: T.Type, url: String, method: HTTPMethods, completion: @escaping((Result<T, Error>) -> ())) {
        let session = URLSession.shared
        if let url = URL(string:url) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let dataTask = session.dataTask (with: request) { (data, response, error) in
        if let _ = error {
            completion(.failure(error!))
        } else if let data = data {
        self.handleResponse(data: data) { response in
            completion(response)
        }
        } else {
        completion(.failure(error!))
        }
        }
        dataTask.resume()
        }
    }
    fileprivate func handleResponse<T:Codable>(data: Data, completion: @escaping((Result<T, Error>) -> ())) {
        do{
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(error))
        }
    }
}
 
