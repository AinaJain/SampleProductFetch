//
//  DynamicValue.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 13/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import Foundation


class DynamicValue {
    
    typealias CompletionHandler = (([Products]) -> Void)
    
    var value : [Products]? {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
//    init(_ value: [Products]) {
//        self.value = value
//    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value(value!) })
    }
    
    deinit {
        observers.removeAll()
    }
}
