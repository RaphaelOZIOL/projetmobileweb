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
    static var urlAddLike = URL(string : "https://projetmobileweb.herokuapp.com/post/addLike")
    static var urlDeleteLike = URL(string : "https://projetmobileweb.herokuapp.com/post/deleteLike")//postId token
    static var urlAddDislike = URL(string : "https://projetmobileweb.herokuapp.com/post/addDislike")
    static var urlDeleteDislike = URL(string : "https://projetmobileweb.herokuapp.com/post/deleteDislike")//postId token
    static var urlAddSignalement = URL(string : "https://projetmobileweb.herokuapp.com/post/addSignalement")
    static var urlDeleteSignalement = URL(string : "https://projetmobileweb.herokuapp.com/post/deleteSignalement")
    static var urlUpdatePost = URL(string : "https://projetmobileweb.herokuapp.com/post/update")
    static var urlGetPostById = URL(string : "https://projetmobileweb.herokuapp.com/post/get/getAllMyPosts/") // :token
    static var urlGetAllNotification = URL(string : "https://projetmobileweb.herokuapp.com/notification/allNotification/") //:token
    static var urlSetNotificationTrue = URL(string : "https://projetmobileweb.herokuapp.com/notification/vue") //:token
    static var urlGetAllReponses = URL(string : "https://projetmobileweb.herokuapp.com/post/allReponse/") //postId
    static var urlCreateReponse = URL(string : "https://projetmobileweb.herokuapp.com/reponse/create") //postId
    static var urlAddLikeReponse = URL(string : "https://projetmobileweb.herokuapp.com/reponse/addLike")
    static var urlDeleteLikeReponse = URL(string : "https://projetmobileweb.herokuapp.com/reponse/deleteLike")//postId token
    static var urlAddDislikeReponse = URL(string : "https://projetmobileweb.herokuapp.com/reponse/addDislike")
    static var urlDeleteDislikeReponse = URL(string : "https://projetmobileweb.herokuapp.com/reponse/deleteDislike")//postId token
    static var urlAddSignalementReponse = URL(string : "https://projetmobileweb.herokuapp.com/reponse/addSignalement")
    static var urlDeleteSignalementReponse = URL(string : "https://projetmobileweb.herokuapp.com/reponse/addSignalement")
    
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
    
    static func createReponse(libelleReponse : String, token: String, postId : String) -> [String: Any]{
        return RequestManager.postRequest(url: urlCreateReponse,postString: RequestManager.getPostStringCreateReponse(libelleReponse: libelleReponse, token: token, postId: postId))
    }
    
    static func createPost(post : Post, token: String) -> [String: Any]{
       return RequestManager.postRequest(url: urlCreatePost,postString: RequestManager.getPostStringCreatePost(post: post, token: token))
    }
    
    static func updatePost(post: Post, token : String) -> [String: Any]{
       return RequestManager.patchRequest(url: urlUpdatePost, postString: RequestManager.getPostStringUpdatePost(post: post, token: token))
    }
    
    static func getAllPost(url : URL) -> PostSet{
        let reponse = RequestManager.getRequestTab(url: url)
        var allPost = PostSet(postTab : [])
        
        print(reponse)
        for post in reponse {
            var pseudo : NSString! = ""
            var id : NSString! = ""
            if let dict = post["userId"] as? NSDictionary
            {
                 pseudo = dict["pseudo"] as! NSString
                 id = dict["_id"] as! NSString
                
            }
            
            let user = User(id : id.description, pseudo : pseudo.description)
            
            
            allPost.add(post : Post(id : post["_id"] as! String, description : post["description"] as! String, libelle: post["libelle"] as! String, categ : post["categorie"] as! String, likeTab : post["like"] as! [String], dislikeTab: post["dislike"] as! [String], signalementTab: post["signalement"] as! [String], user: user, reponses: post["reponses"] as! [Reponse], dateCreation: getDateSwift(d: post["create"] as! String)))
 
            
        }
        return allPost
    }
    
   static func getAllReponse(url : URL) -> ReponseSet{
           let requete = RequestManager.getRequestTab(url: url)
           var allReponse = ReponseSet(reponseTab : [])
           
           print(requete)
           for reponse in requete {
               var pseudo : NSString! = ""
               var id : NSString! = ""
               if let dict = reponse["userId"] as? NSDictionary
               {
                    pseudo = dict["pseudo"] as! NSString
                    id = dict["_id"] as! NSString
                   
               }
               
               let user = User(id : id.description, pseudo : pseudo.description)
               allReponse.add(reponse : Reponse(id: reponse["_id"] as! String, libelle: reponse["libelle"] as! String, likeTab: reponse["like"] as! [String],
                                                dislikeTab: reponse["dislike"] as! [String], signalementTab: reponse["signalement"] as! [String], user: user, dateCreation: getDateSwift(d: reponse["create"] as! String)))
    
               
           }
           return allReponse
       }
    
    static func getAllNotification(url : URL) -> NotificationSet{
           let requete = RequestManager.getRequestTab(url: url)
           var allNotif = NotificationSet(notifTab : [])
           print("NOTIFICATION     ")
           print(requete)
            print("FIIIIIIIIIIIIIIIIN")
           for notif in requete {

                var id : NSString! = ""
                if let dict = notif["postId"] as? NSDictionary
                {
                    id = dict["_id"] as! NSString
                                  
                }
                
                let post = Post(id : id.description)
            print(notif["_id"] as! String + "notifID")
                allNotif.add(notif : NotificationPost(id: notif["_id"] as! String, post : post, estVu : notif["vue"] as! Bool, dateCreation : getDateSwift(d: notif["create"] as! String)))
    
               
           }
           return allNotif
       }
   /* static func getAllNotificationPost(url : URL) -> PostSet{
           let requete = RequestManager.getRequestTab(url: url)
           var allNotifPost = PostSet(postTab: [])
           print("NOTIFICATION     ")
           print(requete)
            print("FIIIIIIIIIIIIIIIIN")
           for post in requete {

                var id : NSString! = ""
                var like : [NSString] = []
                var dislike : [NSString] = []
                var signalement : [NSString] = []
                var reponse : [NSString] = []
                var description : NSString! = ""
                var libelle : NSString! = ""
                var userId : NSString! = ""
                var categorie : NSString! = ""
                var date : NSDate! = NSDate()
                if let dict = post["postId"] as? NSDictionary
                {
                    id = dict["_id"] as! NSString
                    like = dict["like"] as! [NSString]
                    dislike = dict["dislike"] as! [NSString]
                    signalement = dict["signalement"] as! [NSString]
                    reponse = dict["reponse"] as! [NSString]
                    description = dict["description"] as! NSString
                    libelle = dict["libelle"] as! NSString
                    id = dict["_id"] as! NSString
                    id = dict["_id"] as! NSString
                }
                
                let post = Post(id : id.description)
            
                allNotifPost.add(post: post)
    
               
           }
           return allNotifPost
       }*/
    
    static func addLikePost(postId : String, token : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlAddLike, postString: RequestManager.getPostStringPostToken(postId: postId, token: token))
    }
    
    static func getPostStringPostToken(postId : String, token: String) -> String{
        let string = "postId=" + postId + "&token=" + token
        return string
    }
    
    static func getPostStringPostToken(reponseId : String, token: String) -> String{
           let string = "reponseId=" + reponseId + "&token=" + token
           return string
    }
    
    static func deleteLikePost(postId : String, token : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlDeleteLike, postString: RequestManager.getPostStringPostToken(postId: postId, token: token))
    }
    
    static func addDislikePost(postId : String, token: String) -> [String: Any]{
        return RequestManager.patchRequest(url: urlAddDislike,postString: RequestManager.getPostStringPostToken(postId: postId, token: token))
    }
    
    static func deleteDislikePost(postId : String, token : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlDeleteDislike, postString: RequestManager.getPostStringPostToken(postId: postId, token: token))
    }
    
    static func addSignalementPost(postId : String, token: String) -> [String: Any]{
        return RequestManager.patchRequest(url: urlAddSignalement,postString: RequestManager.getPostStringPostToken(postId: postId, token: token))
    }
    
    static func deleteSignalementPost(postId : String, token : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlDeleteSignalement, postString: RequestManager.getPostStringPostToken(postId: postId, token: token))
    }
    
    static func addLikeReponse(reponseId : String, token : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlAddLikeReponse, postString: RequestManager.getPostStringPostToken(reponseId: reponseId, token: token))
    }
    
    static func deleteLikeReponse(reponseId : String, token : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlDeleteLikeReponse, postString: RequestManager.getPostStringPostToken(reponseId: reponseId, token: token))
    }
    
    static func addDislikeReponse(reponseId : String, token: String) -> [String: Any]{
        return RequestManager.patchRequest(url: urlAddDislikeReponse,postString: RequestManager.getPostStringPostToken(reponseId: reponseId, token: token))
    }
    
    static func deleteDislikeReponse(reponseId : String, token : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlDeleteDislikeReponse, postString: RequestManager.getPostStringPostToken(reponseId: reponseId, token: token))
    }
    
    static func addSignalementReponse(reponseId : String, token: String) -> [String: Any]{
        return RequestManager.patchRequest(url: urlAddSignalementReponse,postString: RequestManager.getPostStringPostToken(reponseId: reponseId, token: token))
    }
    
    static func deleteSignalementReponse(reponseId : String, token : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlDeleteSignalementReponse, postString: RequestManager.getPostStringPostToken(reponseId: reponseId, token: token))
    }
    
    static func setNotificationTrue(notificationId : String) -> [String:Any]{
        return RequestManager.patchRequest(url: urlSetNotificationTrue, postString: RequestManager.getPostStringNotif(notificationId: notificationId))
    }
    
    static func getPostStringNotif(notificationId : String) -> String{
        let string1 = "notificationId=" + notificationId

        return string1
    }
    
    static func getUser(token: String) -> User{
        var reponse = RequestManager.getRequest(url: URL(string: urlGetUser!.absoluteString + token))
        if let a = reponse["email"] {
            
            let date = getDateSwift(d : reponse["birthday"] as! String)
            return User(email: String(describing: reponse["email"] as! String), pseudo: String(describing: reponse["pseudo"] as! String), firstname: String(describing: reponse["firstname"] as! String), lastname: String(describing: reponse["lastname"] as! String), birthday: date, adress: String(describing: reponse["adress"] as! String), tel: (reponse["tel"] as! Int).description)
        }
        return User()
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
    
    static func getPostStringCreateReponse(libelleReponse: String, token: String, postId: String) -> String{
        return "libelle=" + libelleReponse + "&token=" + token + "&postId=" + postId;
    }
    
    static func getPostStringCreatePost(post : Post, token: String) -> String{
        return "description=" + post.description + "&libelle=" + post.libelle + "&token=" + token + "&categorie=" + post.categ
    }
    
    static func getPostStringUpdatePost(post : Post, token: String) -> String{
        return "postId=" + post.id + "&description=" + post.description + "&libelle=" + post.libelle + "&categorie=" + post.categ + "&token=" + token
        
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
    
    static func getStringDate(d : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        formatter.locale = Locale(identifier: "fr_FR") // Spanish from Spain
        formatter.dateStyle = .long
        return formatter.string(from: d) // returns "10 de diciembre, 2018"
        
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
