//
//  RequestHandler.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 13/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import Foundation

class RequestHandler {
    
    let reachability = Reachability()!

    
    func networkResult(completion: @escaping ((ProductInfo?,String?) -> Void)) ->
        ((Data?,String?) -> Void) {
            
            return { dataResult,error   in
                
                DispatchQueue.global(qos: .background).async(execute: {
                    guard let data = dataResult else {
                        return completion(nil,error)}
                    ParserHelper.parse(data: data, completion: { (productInfo) in
                        return completion(productInfo,nil)
                    })
                })
                
            }
    }
}
