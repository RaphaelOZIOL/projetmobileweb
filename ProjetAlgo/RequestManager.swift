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
    static var urlGetUser = URL(string : "https://projetmobileweb.herokuapp.com/user/info/")
    static var urlGetAllPost = URL(string : "https://projetmobileweb.herokuapp.com/post/get/allPost")
    static var urlUpdateUser = URL(string : "https://projetmobileweb.herokuapp.com/user/edit")
    static var urlAddLike = URL(string : "https://projetmobileweb.herokuapp.com/post/addLike") //postId token
    
    static func loginRequest(email: String, pwd : String) -> [String: Any]{
       return RequestManager.postRequest(url: urlLogin,postString: RequestManager.getPostStringLogin(email: email, password: pwd))
    }
    
    static func getPostStringLogin(email : String , password : String) -> String{
        return "email=" + email + "&password=" + password;
    }
    
    static func signUpRequest(user : User) -> [String: Any]{
       return RequestManager.postRequest(url: urlSignUp,postString: RequestManager.getPostStringSignUp(user: user))
    }
    
    static func updateUserRequest(user : User, token: String) -> [String: Any]{
        return RequestManager.patchRequest(url: urlUpdateUser,postString: RequestManager.getPostStringUpdateUser(user: user, token: token))
    }
    
    static func createPost(post : Post, token: String) -> [String: Any]{
       return RequestManager.postRequest(url: urlCreatePost,postString: RequestManager.getPostStringCreatePost(post: post, token: token))
    }
    
    static func getAllPost() -> [Post]{
        let reponse = RequestManager.getRequestTab(url: urlGetAllPost)
        var allPost : [Post] = []
        var i = 0
        print(reponse)
        for post in reponse {
            var pseudo : NSString! = ""
            var id : NSString! = ""
            if let dict = post["userId"] as? NSDictionary
            {
                 pseudo = dict["pseudo"] as! NSString
                 id = dict["_id"] as! NSString
                
            }
            
            let user = User(id : id.integerValue, pseudo : pseudo.description)
            
            
            allPost.append(Post(id: i, description : post["description"] as! String, libelle: post["libelle"] as! String, categ : post["categorie"] as! String, likeTab : post["like"] as! [User], dislikeTab: post["dislike"] as! [User], signalementTab: post["signalement"] as! [User], user: user, reponses: post["reponses"] as! [Reponse], dateCreation: getDateSwift(d: post["create"] as! String)))
 
            i = i+1
        }
        return allPost
    }
    
    static func addLikePost(postId : Int, token : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlAddLike, postString: RequestManager.getPostStringAddLike(postId: postId, token: token))
    }
    
    static func getUser(token: String) -> User{
        var reponse = RequestManager.getRequest(url: URL(string: urlGetUser!.absoluteString + token))
        if let a = reponse["email"] {
            
            let date = getDateSwift(d : reponse["birthday"] as! String)
            return User(email: String(describing: reponse["email"] as! String), pseudo: String(describing: reponse["pseudo"] as! String), firstname: String(describing: reponse["firstname"] as! String), lastname: String(describing: reponse["lastname"] as! String), birthday: date, adress: String(describing: reponse["adress"] as! String), tel: (reponse["tel"] as! Int).description)
        }
        return User()
    }
    
    static func getPostStringAddLike(postId : Int, token: String) -> String{
        let string = "postId=" + postId.description + "&token=" + token
        return string
    }
    
    static func getPostStringSignUp(user : User) -> String{
        let birthday = getDateJS(date: user.birthday)
        let string1 = "password=" + user.password + "&email=" + user.email + "&pseudo=" + user.pseudo + "&firstname=" + user.firstname
        let string2 = "&lastname=" + user.lastname + "&birthday=" + birthday + "&adress=" + user.adress + "&tel=" + user.tel
        return string1 + string2
    }
    
    static func getPostStringUpdateUser(user : User, token: String) -> String{
        let birthday = getDateJS(date: user.birthday)
        let string1 = "token=" + token + "&email=" + user.email + "&pseudo=" + user.pseudo + "&firstname=" + user.firstname
        let string2 = "&lastname=" + user.lastname + "&birthday=" + birthday + "&adress=" + user.adress + "&tel=" + user.tel
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
    
    static func getDateSwift(d : String) -> Date{

        let iso = ISO8601DateFormatter()
        iso.formatOptions =  [.withInternetDateTime, .withFractionalSeconds]
        return iso.date(from: d as! String)!
 
    }
    
    static func getRequest(url : URL?) -> [String: Any]{
        var reponse:[String: Any] = [:]
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    reponse = json!
                    
                }
            }
            semaphore.signal()
        }
        
        task.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return reponse
    }
    
    static func getRequestTab(url : URL?) -> [[String: Any]]{
        var reponse : [[String: Any]] = [[:]]
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    reponse = json!
                    
                }
            }
            semaphore.signal()
        }
        
        task.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return reponse
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
    
    static func patchRequest(url : URL?, postString : String) -> [String: Any] {
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PATCH"
        var reponse:[String: Any] = [:]
        request.httpBody = postString.data(using: String.Encoding.utf8);
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
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
    


        //static func patchRequest(url : URL?, jsonPatch : [String: Any]) -> [String: Any] {
           /* guard let requestUrl = url else { fatalError() }
            var reponse:[String: Any] = [:]
            
            var request = URLRequest(url: requestUrl)
            request.httpMethod = "PATCH"
            
            //request.httpBody = postString.data(using: String.Encoding.utf8);
            
            var jsonError: NSError?
            do{
                try request.httpBody = JSONSerialization.data(withJSONObject: jsonPatch)
            } catch {
                    print("ERROR")
                }

            
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
            */
           /* var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "PATCH"
            urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonPatch. //bodyString.data(using: .utf8)
            */
            
      /*
            
            let request = NSMutableURLRequest(url: url!)
            request.httpMethod = "PATCH"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            do{

               //let json: [String: Any] = ["status": "test"]
               let jsonData = try? JSONSerialization.data(withJSONObject: jsonPatch)
                request.httpBody = jsonData
                print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
            } catch {
                print("ERROR")
            }

            let semaphore = DispatchSemaphore(value: 0)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in

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
    
    */
    
    
    
}
