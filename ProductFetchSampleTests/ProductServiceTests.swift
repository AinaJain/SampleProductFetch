//
//  ProductServiceTests.swift
//  TemplateProjectTests
//
//  Created by Benoit PASQUIER on 01/02/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import XCTest
@testable import ProductFetchSample

class ProductServiceTests: XCTestCase {
    
    func testCancelRequest() {
        
        // giving a "previous" session
        ProductService.shared.fetchProductInfo { (_, _) in
            // ignore call
        }
        // Expected to task nil after cancel
        ProductService.shared.cancelfetchProducts()
        XCTAssertNil(ProductService.shared.task, "Expected task nil")
    }
}
