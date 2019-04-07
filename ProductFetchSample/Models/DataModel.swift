//
//  DataModel.swift
//  ProductFetchSample
//
//  Created by Aina Jain on 02/04/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//


import Foundation
struct DataModel : Codable {
	let searchTerm : String?
	let products : [Products]?

	enum CodingKeys: String, CodingKey {
		case searchTerm = "searchTerm"
		case products = "products"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		searchTerm = try values.decodeIfPresent(String.self, forKey: .searchTerm)
		products = try values.decodeIfPresent([Products].self, forKey: .products)
	}

}
