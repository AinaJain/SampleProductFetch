//
//  ParserHelper.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 13/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import Foundation


final class ParserHelper {
    
    static func parse(data: Data, completion : (ProductInfo?) -> Void) {
        
        do {
            let jsonDecoder = JSONDecoder()
            let responseModel = try jsonDecoder.decode(ProductInfo.self, from: data)
                completion(responseModel)
            
        } catch {
            // can't parse json
            completion(nil)
        }
    }
}
