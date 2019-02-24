//
//  WebConnection.swift
//  SPHExam
//
//  Created by Joseph Chua on 24/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import UIKit

class WebConnectManager{
    
    static let webConnection:WebConnectManager = WebConnectManager()
    let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }()
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        
        let cache = URLCache.shared
        
        let requestURL = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        if let data = cache.cachedResponse(for: requestURL)?.data {
             completion(data, nil,nil)
        } else {
            session.dataTask(with: requestURL, completionHandler: {data, response, error -> Void in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300 {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: requestURL)
                    
                    completion(data, response, error)
                }
            }).resume()
        }
        
    }
    
}
