//
//  Products.swift
//  ProductFetchSample
//
//  Created by Aina Jain on 02/04/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//


import Foundation
struct Products : Codable {
	let id : String?
	let name : String?
	let price : Price?
	let images : [String]?
	let brand : String?
	let review : Review?
	let otherOfferings : OtherOfferings?
	let itemCount : Int?
	let tags : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case price = "price"
		case images = "images"
		case brand = "brand"
		case review = "review"
		case otherOfferings = "otherOfferings"
		case itemCount = "itemCount"
		case tags = "tags"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		price = try values.decodeIfPresent(Price.self, forKey: .price)
		images = try values.decodeIfPresent([String].self, forKey: .images)
		brand = try values.decodeIfPresent(String.self, forKey: .brand)
		review = try values.decodeIfPresent(Review.self, forKey: .review)
		otherOfferings = try values.decodeIfPresent(OtherOfferings.self, forKey: .otherOfferings)
		itemCount = try values.decodeIfPresent(Int.self, forKey: .itemCount)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
	}
    
    init( id : String?,name : String?,price : Price?,images : [String]?,brand : String?,review : Review?,otherOfferings : OtherOfferings?,itemCount : Int?,tags : [String]?) {
        self.id = id
        self.name = name
        self.price = price
        self.images = images
        self.review = review
        self.brand = brand
        self.otherOfferings = otherOfferings
        self.itemCount = itemCount
        self.tags = tags
    }
    


}
