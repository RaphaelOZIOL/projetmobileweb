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
    static var urlSignUp = URL(string: "https://projetmobileweb.herokuapp.com/user/signup")
    static var urlCreatePost = URL(string: "https://projetmobileweb.herokuapp.com/post/create")
    //static var urlGeAllPost
    
    static func loginRequest(email: String, pwd : String) -> [String: Any]{
       return RequestManager.postRequest(url: urlLogin,postString: RequestManager.getPostStringLogin(email: email, password: pwd))
    }
    
    static func getPostStringLogin(email : String , password : String) -> String{
        return "email=" + email + "&password=" + password;
    }
    
    static func signUpRequest(user : User) -> [String: Any]{
       return RequestManager.postRequest(url: urlSignUp,postString: RequestManager.getPostStringSignUp(user: user))
    }
    
    static func createPost(post : Post, token: String) -> [String: Any]{
       return RequestManager.postRequest(url: urlCreatePost,postString: RequestManager.getPostStringCreatePost(post: post, token: token))
    }
    
    static func getPostStringSignUp(user : User) -> String{
        var birthday = getDateJS(date: user.birthday)
        var string1 = "password=" + user.password + "&email=" + user.email + "&pseudo=" + user.pseudo + "&firstname=" + user.firstname
        var string2 = "&lastname=" + user.lastname + "&birthday=" + birthday + "&adress=" + user.adress + "&tel=" + user.tel
        return string1 + string2
    }
    
    static func getPostStringCreatePost(post : Post, token: String) -> String{
        return "description=" + post.description + "&libelle=" + post.libelle + "&token=" + token + "&categorie=" + post.categ
    }
    
    static func getDateJS(date : Date) -> String{
        var dateString = date.description
        let e = dateString.firstIndex(of: " ")!
        let f = dateString[...e]
        print(f.description)
        return f.description
        
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
    
    
    
    
}
