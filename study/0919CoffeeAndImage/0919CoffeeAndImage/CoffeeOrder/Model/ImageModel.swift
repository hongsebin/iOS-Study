//
//  ImageModel.swift
//  0919CoffeeAndImage
//
//  Created by yeoboya3 on 2023/10/18.
//

import Foundation

struct PhotoResponse: Decodable {
    let results: [Photo]
}

struct Collection: Decodable {

}

struct Photo: Decodable {
    let urls: PhotoURLs
    let id: String
    let created_at: String
    let width: Int
    let height: Int
    let color: String
    let blur_hash: String
    let likes: Int
    let liked_by_user: Bool
    let description: String?
    let user: User
    let current_user_collections: [Collection]
    let links: Links
}

struct PhotoURLs: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

struct User: Decodable {
    let id: String
    let username: String
    let name: String
    let first_name: String
    let last_name: String?
    let instagram_username: String?
    let twitter_username: String?
    let portfolio_url: String?
    let profile_image: ProfileImage
    let links: UserLinks
}

struct ProfileImage: Decodable {
    let small: String
    let medium: String
    let large: String
}

struct UserLinks: Decodable {
    let `self`: String
    let html: String
    let photos: String
    let likes: String
}

struct Links: Decodable {
    let `self`: String
    let html: String
    let download: String
}

