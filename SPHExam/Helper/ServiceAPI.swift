//
//  ServiceAPI.swift
//  SPHExam
//
//  Created by Joseph Chua on 24/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation

func getListDataFromAPIWithParameters(
    completion: @escaping (_ dataResponse:DataResponse) -> Void,
    serviceError:@escaping (_ message:String) -> Void){
    
    let originalURL = Constants.BASEURL + Constants.RESOURCE_ID
    let escapedURL = originalURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    
    guard let APIurl = URL(string: escapedURL ?? "") else {
        print("cannot create URL")
        return
    }
    
    WebConnectManager.webConnection.getDataFromUrl(url: APIurl, completion: {(data, response, error)  in
        
        if error != nil{
            serviceError("Server Error. Please check your internet connection and try again.")
        }
        else{
            guard let data = data else {
                
                serviceError("Malformed Data")
                return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(DataResponse.self, from: data)
                
                completion(response)
                
            } catch {
                serviceError("Malformed Data")
            }
        }
        
    })
    
}

