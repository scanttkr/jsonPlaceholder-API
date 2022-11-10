//
//  Model.swift
//  jsonPlaceholder API
//
//  Created by can on 7.11.2022.
//  Copyright © 2022 can. All rights reserved.
//

import Foundation
class Model {
    // MARK: - WelcomeElement
    struct WelcomeElement: Codable {
        let userID, id: Int
        let title, body: String

        enum CodingKeys: String, CodingKey {
            case userID = "userId"
            case id, title, body
        }
    }

}
