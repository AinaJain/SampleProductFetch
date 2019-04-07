//
//  ProductDataSourceTests.swift
//  TemplateProjectTests
//
//  Created by Benoit PASQUIER on 01/02/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import XCTest
@testable import ProductFetchSample

class ProductDataSourceTests: XCTestCase {
    
    var dataSource : ProductDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = ProductDataSource()
    }
    
    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }
    
    func testEmptyValueInDataSource() {
        
        // giving empty data value
        dataSource.data?.value = []
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected zero cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
//    func testValueInDataSource() {
//        
//        // giving data value
//        let obj1 = Products(id: "111", name: "sample1", price: nil, images: nil, brand: "SampleBrand1", review: nil, otherOfferings: nil, itemCount: 10, tags: nil)
//        let obj2 = Products(id: "222", name: "sample2", price: nil, images: nil, brand: "SampleBrand2", review: nil, otherOfferings: nil, itemCount: 10, tags: nil)
//        dataSource.data?.value = [obj1, obj2]
//        
//        let tableView = UITableView()
//        tableView.dataSource = dataSource
//        
//        // expected one section
//        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
//        
//        // expected two cells
//        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
//    }
    
    func testValueCell() {
        
        // giving data value
        let obj1 = Products(id: "111", name: "sample1", price: nil, images: nil, brand: "SampleBrand1", review: nil, otherOfferings: nil, itemCount: 10, tags: nil)
        dataSource.data?.value = [obj1]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        // expected ProductCell class
        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? ProductCell else {
            XCTAssert(false, "Expected ProductCell class")
            return
        }        
    }
}
