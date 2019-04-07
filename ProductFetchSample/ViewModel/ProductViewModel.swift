//
//  ProductViewModel.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 13/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import Foundation

struct ProductViewModel {
    
    var dataSource : ProductDataSource?
    weak var service: ProductServiceProtocol?
    
    var onErrorHandling : ((String?) -> Void)?
    var onSuccessHandling : ((ProductDataSource?) -> Void)?

    init(service: ProductServiceProtocol = ProductService.shared, dataSource : ProductDataSource?) {
        self.dataSource = dataSource
        self.service = service
    }
//
//    init(service: ProductServiceProtocol = FileDataService.shared, dataSource : ProductDataSource?) {
//        self.dataSource = dataSource
//        self.service = service
//    }
    
    func fetchProducts() {
        
        guard let service = service else {
            onErrorHandling?("Missing service")
            return
        }
        
        service.fetchProductInfo { productInfo,error in
            DispatchQueue.main.async {
                guard let productInfo = productInfo else {
                    return (self.onErrorHandling?(error))!
                    
                }
                self.dataSource?.data = DynamicValue()//((productInfo.data?.products)!)
                
                self.dataSource?.data?.value = productInfo.data?.products
                self.onSuccessHandling?(self.dataSource)
        }
    }
    }
}
