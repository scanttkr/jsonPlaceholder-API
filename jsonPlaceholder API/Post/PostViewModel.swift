//
//  postViewModel.swift
//  jsonPlaceholder API
//
//  Created by can on 7.11.2022.
//  Copyright © 2022 can. All rights reserved.
//

import Foundation

class PostViewModel {
    var postItems = [Post]()
    
    func getPostItems(complete: @escaping((String?)->())) {
        PostManager.shared.getPostItems { (items, errorMessage) in
            if let items = items {
                self.postItems = items
            }
            complete(errorMessage)
        }
    }
}
