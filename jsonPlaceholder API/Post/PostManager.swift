//
//  postManager.swift
//  jsonPlaceholder API
//
//  Created by can on 7.11.2022.
//  Copyright © 2022 can. All rights reserved.
//

import Foundation
class PostManager {
    static let shared = PostManager()
    func getPostItems (completion: @escaping (([Post]?, String?)->())) {
        let url = "\(NetworkHelper.shared.baseURL)posts"
        NetworkManager.shared.fetch(type: [Post].self, url: url, method: .get) { response in
            switch response {
            case.success(let items):
                completion(items, nil)
            case.failuure(let error):
                completion(nil, error)
            
            }
        }
    
    }
    
}
