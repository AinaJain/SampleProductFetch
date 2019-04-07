//
//  ProductService.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 13/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import Foundation

protocol ProductServiceProtocol : class {
    func fetchProductInfo(_ completion: @escaping ((ProductInfo?,String?) -> Void))
}

final class ProductService : RequestHandler, ProductServiceProtocol {
    
    static let shared = ProductService()
    
    let endpoint = "https://www.blibli.com/backend/search/products?searchTerm=samsung&start=0&itemPerPage=24"
    var task : URLSessionTask?
    
    func fetchProductInfo(_ completion: @escaping ((ProductInfo?,String?) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelfetchProducts()
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: { (productInfo, error) in
            if let productInfo = productInfo {
            completion(productInfo,nil)
            } else {
                completion(nil,error)

            }
        }))

    }
    
    func cancelfetchProducts() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
