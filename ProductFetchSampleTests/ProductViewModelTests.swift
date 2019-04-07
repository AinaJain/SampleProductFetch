//
//  ProductViewModelTests.swift
//  TemplateProjectTests
//
//  Created by Benoit Pasquier on 31/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import XCTest
@testable import ProductFetchSample

class ProductViewModelTests: XCTestCase {
    
    var viewModel : ProductViewModel!
    var dataSource : ProductDataSource!
    fileprivate var service : MockProductService!
    
    override func setUp() {
        super.setUp()
        self.service = MockProductService()
        self.dataSource = ProductDataSource()
        self.viewModel = ProductViewModel(service: service, dataSource: dataSource)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }
    
    func testFetchWithNoService() {
        
        let expectation = XCTestExpectation(description: "No service Product")
        
        // giving no service to a view model
        viewModel.service = nil
        
        // expected to not be able to fetch currencies
        viewModel.onErrorHandling = { error in 
            expectation.fulfill()
        }
        
        viewModel.fetchProducts()
        wait(for: [expectation], timeout: 5.0)
    }
    
    
    
    func testFetchNoCurrencies() {
        
        let expectation = XCTestExpectation(description: "No Product")
        
        // giving a service mocking error during fetching currencies
        service.productInfo = nil
        
        // expected completion to fail
        viewModel.onErrorHandling = { error in 
            expectation.fulfill()
        }
        
        viewModel.fetchProducts()
        wait(for: [expectation], timeout: 5.0)
    }
}

fileprivate class MockProductService : ProductServiceProtocol {
    var productInfo : ProductInfo?

    func fetchProductInfo(_ completion: @escaping ((ProductInfo?, String?) -> Void)) {

        if let productInfo = productInfo {
            completion(productInfo,nil)
        } else {
            completion(nil,"error")
        }
    }
}

