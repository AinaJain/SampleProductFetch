//
//  Review.swift
//  ProductFetchSample
//
//  Created by Aina Jain on 02/04/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//


import Foundation
struct Review : Codable {
	let rating : Int?
	let count : Int?

	enum CodingKeys: String, CodingKey {

		case rating = "rating"
		case count = "count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rating = try values.decodeIfPresent(Int.self, forKey: .rating)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
	}

}
