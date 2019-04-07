//
//  ProductInfo.swift
//  ProductFetchSample
//
//  Created by Aina Jain on 02/04/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//


import Foundation
struct ProductInfo : Codable {
	let code : Int?
	let status : String?
	let data : DataModel?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case status = "status"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		data = try values.decodeIfPresent(DataModel.self, forKey: .data)
	}
    
    init( code : Int?,status : String?,data : DataModel? ) {
        self.code = code
        self.status = status
        self.data = data
    }

}
