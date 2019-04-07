//
//  RequestService.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 13/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import Foundation

final class RequestService {
    
    // todo add model
    func loadData(urlString: String, session: URLSession = URLSession(configuration: .default), completion: @escaping (Data?,String?) -> Void) -> URLSessionTask? {
        
        guard let url = URL(string: urlString) else {
            completion(nil,"Wrong url format")
            return nil
        }
        
        var request = RequestFactory.request(method: .GET, url: url)
        
        if let reachability = Reachability(), !reachability.isReachable {
            request.cachePolicy = .returnCacheDataDontLoad
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil,"An error occured during request : \(error.localizedDescription)")
                return
            }
            
            if let productInfo = data {
                completion(productInfo,nil)
            }
        }
        task.resume()
        return task
    }
}
