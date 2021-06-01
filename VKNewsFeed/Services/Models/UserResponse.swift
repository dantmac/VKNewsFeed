//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by admin on 01.06.2021.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
