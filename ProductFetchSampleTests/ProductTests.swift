//
//  ProductTests.swift
//  TemplateProjectTests
//
//  Created by Benoit PASQUIER on 01/02/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import XCTest
@testable import ProductFetchSample

class ProductTests: XCTestCase {
    
    func testParseEmptyProduct() {
        
        // giving empty data
        let data = Data()
        
        // giving completion after parsing 
        // expected valid ProductInfo with valid data
        let _ : ((ProductInfo?) -> Void) = { result in
            if let _ = result {
                ParserHelper.parse(data: data, completion: { (productInfo) in
                    if productInfo != nil {
                        XCTAssert(true, "Expected data")
                    }
                })
            } else {
                XCTAssert(false, "Expected failure when no data")
            }
        }
    }
    
    

}
