//
//  Review.swift
//  MovieApp
//
//  Created by Ramill Ibragimov on 04.03.2021.
//

import Foundation

struct ReviewResponse: Codable {
    var results: [Review]
}

struct Review: Codable, Identifiable {
    var id: String?
    var author: String?
    var content: String?
}
