//
//  Price.swift
//  ProductFetchSample
//
//  Created by Aina Jain on 02/04/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//


import Foundation
struct Price : Codable {
	let priceDisplay : String?
	let strikeThroughPriceDisplay : String?
	let discount : Int?
	let minPrice : Double?

	enum CodingKeys: String, CodingKey {

		case priceDisplay = "priceDisplay"
		case strikeThroughPriceDisplay = "strikeThroughPriceDisplay"
		case discount = "discount"
		case minPrice = "minPrice"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		priceDisplay = try values.decodeIfPresent(String.self, forKey: .priceDisplay)
		strikeThroughPriceDisplay = try values.decodeIfPresent(String.self, forKey: .strikeThroughPriceDisplay)
		discount = try values.decodeIfPresent(Int.self, forKey: .discount)
		minPrice = try values.decodeIfPresent(Double.self, forKey: .minPrice)
	}

}
