//
//  RequestManager.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import Foundation

class RequestManager : Identifiable{

    static var urlLogin = URL(string: "https://projetmobileweb.herokuapp.com/user/login")
    //static var urlGeAllPost
    
    static func loginRequest(email: String, pwd : String){
        RequestManager.postRequest(url: urlLogin,postString: RequestManager.getPostStringLogin(email: email, password: pwd))
    }
    
    static func getRequest(url : URL?){
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                }
            }
        }
        task.resume()
    }
    
    static func postRequest(url : URL?, postString : String) -> [String: Any] {
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        var reponse:[String: Any] = [:]
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error took place \(error)")
                    
                }
         
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    reponse = json!
        
                    
                }
            semaphore.signal()
        }
        task.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return reponse
        
    }
    
    
    static func getPostStringLogin(email : String , password : String) -> String{
        return "email=" + email + "&password=" + password;
    }
}
