//
//  OtherOfferings.swift
//  ProductFetchSample
//
//  Created by Aina Jain on 02/04/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//


import Foundation
struct OtherOfferings : Codable {
	let count : Int?
	let startPrice : String?
	let allOfferPageUrl : String?

	enum CodingKeys: String, CodingKey {

		case count = "count"
		case startPrice = "startPrice"
		case allOfferPageUrl = "allOfferPageUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		startPrice = try values.decodeIfPresent(String.self, forKey: .startPrice)
		allOfferPageUrl = try values.decodeIfPresent(String.self, forKey: .allOfferPageUrl)
	}

}
