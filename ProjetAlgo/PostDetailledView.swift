//
//  PostDetailledView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct PostDetailledView: View {
    
    @ObservedObject var post : Post
    @ObservedObject var reponseList : ReponseSet //RequestManager.getAllReponse(url : URL(string: RequestManager.urlGetAllReponses!.absoluteString + post.id)!)
    @EnvironmentObject var settings: userSettings
    @State var reponseText : String = ""
    @ObservedObject var notifTab : NotificationSet
    @ObservedObject var postTab : PostSet
    var cat = ["Personel","Livre","Film","Humour","Citation","Réseaux","Autre"]
        
    
    init(post : Post, notifTab : NotificationSet, postTab : PostSet){
        self.post = post
        self.notifTab = notifTab
        self.reponseList = RequestManager.getAllReponse(url : URL(string: RequestManager.urlGetAllReponses!.absoluteString + post.id)!)
        self.postTab = postTab
    }
    
    var body: some View {
        var notifId = ""
        //print(self.notifTab.notifTab[0].dateCreation)
        if(self.notifTab.notifTab.count > 0 && self.notifTab.notifTab.count == self.postTab.postTab.count){
            notifId = self.notifTab.getIdNotifByPostId(postId: self.post.id)
        }
        if(notifId != "" && self.notifTab.estPasVuByPost(postId: self.post.id)){
            let reponse = RequestManager.setNotificationTrue(notificationId: notifId)
         
            if((reponse["text"] as! String) != "Succès"){
                print("Pas connecté A")
            }
            else{
                self.notifTab.setEstVuByPost(postId: self.post.id)
                let postSet = self.postTab.getAllPostNotified(notifTab: RequestManager.getAllNotification(url : URL(string: RequestManager.urlGetAllNotification!.absoluteString + self.settings.token)!))
                self.postTab.updateTab(postTab: postSet.postTab)
            }
        }
        else{
            print("Pas son post ou notif deja vu")
        }
   
        var categorie:Int = 0
        let c = cat.count
        for i in 0..<c {
            if(cat[i] == post.categ){
                categorie = i
            }
        }
        
             
        return  HStack {
             
             VStack (alignment: .leading){
                
                VStack (alignment: .leading){
                    
                    
                    HStack(spacing : 5) {
                        Image(systemName: "person.crop.circle")
                        .font(.subheadline)
                            .padding([.top,.trailing], 15)
                        .foregroundColor(.secondary)
                       
                        
                        Text(post.user.pseudo)
                        .font(.headline)
                            .padding(.top, 15)
                        //.lineLimit(nil)
                      //  .layoutPriority(999)
                    }
                    
                    HStack() {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(post.description)
                                .font(.headline)
                                .lineLimit(2)
                                .layoutPriority(1000)

                            Text(RequestManager.getStringDate(d:  post.dateCreation)) // Date
                                .font(.caption)
                                .padding(.trailing, 15)
                                .lineLimit(nil)
                                .layoutPriority(999)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            if(self.settings.id == post.user.id.description){
                                NavigationLink(destination: EditPostView(post: self.post, categorie: categorie, cat : RequestManager.getAllCategorie(url: RequestManager.urlGetAllCategorie!), postTab : self.postTab)){
                                        Text("Modifier")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 90, height: 40)
                                    .background(Color.green)
                                    .cornerRadius(15.0)
                                    .shadow(radius: 10.0, x: 20, y: 10)
                                }
                            }
                        }
                        
                        //ici
                        Spacer()
                        VStack(alignment: .trailing, spacing: 5) {
                                                           
                            Text(post.categ) // Date
                            .font(.caption)
                            
                            .lineLimit(nil)
                            .layoutPriority(999)
                            
                        }.padding([.trailing, .leading], 15)
                        
                    }
                    .padding(.leading, 5)
                    .padding(.bottom, 10)
                    
                    VStack(){
                        Text(post.libelle) // Date
                        .font(.caption)
                            
                        .lineLimit(nil)
                        .layoutPriority(999)
                        
                    }
                    
                   // StarContainerPostView(post : post)
                }.padding(.bottom,30)
                 
                 
                 
                    
                         
                         //StarContainerPostView(post : post)
                if(self.settings.token != ""){
                    ButtonsPostView(post : post)
                }
                else{
                    ButtonsPostNoConnectedView(post: post)
                    .padding(.bottom,30)
                }
            
                 
                     
                 
                if(self.settings.token != ""){
                    HStack(){
                        TextField("Entrer votre réponse", text: self.$reponseText)
                        Button(action : {
                            let reponse = RequestManager.createReponse(libelleReponse: self.reponseText, token: self.settings.token, postId: self.post.id)
                            print(reponse)
                            if((reponse["text"] as! String) != "Succès"){
                                
                                print("Pas connecté A")
                            }
                            else{
                                self.reponseList.add(reponse: Reponse(id : reponse["id"] as! String, libelle : self.reponseText))
                                self.reponseText = ""
                              //  self.$reponseText.animation()
                            }
                            
                            }){
                            HStack{
                                /*Image(systemName: "safari")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)*/
                                    
                                Text("Envoyer")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 100, height: 50)
                                    .background(Color.blue)
                                    .cornerRadius(15.0)
                                    .shadow(radius: 10.0, x: 20, y: 10)
                            }
                        }
                            
                        
                    }
                }
                
                
                ListReponseView(reponseList : reponseList)
             }
            
            
            }
        
        

    }
   
}
/*
struct PostDetailledView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailledView(post : Post())
    }
}*/
