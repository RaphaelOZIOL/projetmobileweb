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
    var cat = ["Personel","Livre","Film","Humour","Citation","Réseaux","Autre"]
        
    
    init(post : Post){
        self.post = post
        self.reponseList = RequestManager.getAllReponse(url : URL(string: RequestManager.urlGetAllReponses!.absoluteString + post.id)!)
    }
    
    var body: some View {
        
        
        var categorie:Int = 0
        let c = cat.count
        for i in 0..<c {
            if(cat[i] == post.categ){
                categorie = i
            }
        }
        if(self.settings.id == post.user.id.description){
         return AnyView(
             
         HStack {
             
             VStack (alignment: .leading){
                 
                 
                 
                     VStack (alignment: .leading){
                         HStack() {
                             Image(systemName: "person.crop.circle")
                                 .font(.subheadline)
                                 .padding(.top, 5)
                                 .foregroundColor(.secondary)

                             VStack(alignment: .leading, spacing: 5) {
                                 Text(post.libelle)
                                     .font(.headline)
                                     .lineLimit(2)
                                     .layoutPriority(1000)

                                 Text(post.dateCreation.description) // Date
                                     .font(.caption)
                                     
                                     .lineLimit(nil)
                                     .layoutPriority(999)
                                
                                
                            
                            }
                            VStack(alignment: .leading, spacing: 5) {

                                NavigationLink(destination: EditPostView(post: self.post, categorie: categorie)){
                                        Text("Modifier")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 100, height: 50)
                                    .background(Color.green)
                                    .cornerRadius(15.0)
                                    .shadow(radius: 10.0, x: 20, y: 10)
                                }
                            }
                            
                             
                             
                         }
                         .padding(.leading, 5)
                         .padding([.top, .bottom], 10)
                         
                         VStack(){
                             Text(post.description) // Date
                             .font(.caption)
                                 
                             .lineLimit(nil)
                             .layoutPriority(999)
                             
                         }
                         
                         StarContainerPostView(post : post)
                     }
                 
                     
                 ButtonsPostView(post : post)
                
                HStack(){
                    TextField("Enter your name", text: self.$reponseText)
                    Button(action : {
                        let reponse = RequestManager.createReponse(libelleReponse: self.reponseText, token: self.settings.token, postId: self.post.id)
                        print(reponse)
                        if((reponse["text"] as! String) != "Succès"){
                            
                            print("Pas connecté A")
                        }
                        else{
                            self.reponseList.add(reponse: Reponse(libelle : self.reponseText))
                            self.reponseText = ""
                            self.$reponseText.animation()
                        }
                        
                        }){
                        HStack{
                            /*Image(systemName: "safari")
                                .font(.subheadline)
                                .foregroundColor(.secondary)*/
                                
                            Text("Envoyer")
                                .font(.subheadline)
                                .lineLimit(2)
                                .foregroundColor(.secondary)
                        }
                    }
                        
                    
                }
                
                Spacer()
                ListReponseView(reponseList : reponseList)
             }
            
            
            }
        )
        }
        else{
            return AnyView(
                
            HStack {
                
                VStack (alignment: .leading){
                    
                    
                    
                        VStack (alignment: .leading){
                            HStack() {
                                Image(systemName: "person.crop.circle")
                                    .font(.subheadline)
                                    .padding(.top, 5)
                                    .foregroundColor(.secondary)

                                VStack(alignment: .leading, spacing: 5) {
                                    Text(post.libelle)
                                        .font(.headline)
                                        .lineLimit(2)
                                        .layoutPriority(1000)

                                    Text(post.dateCreation.description) // Date
                                        .font(.caption)
                                        
                                        .lineLimit(nil)
                                        .layoutPriority(999)
                                }
                                
                                
                            }
                            .padding(.leading, 5)
                            .padding([.top, .bottom], 10)
                            
                            VStack(){
                                Text(post.description) // Date
                                .font(.caption)
                                    
                                .lineLimit(nil)
                                .layoutPriority(999)
                                
                            }
                            
                            StarContainerPostView(post : post)
                        }
                    
                        
                    HStack{
                        if(self.settings.token != ""){
                            ButtonsPostView(post : post)
                        }
                    }
                }

        }
            )
                }

    }
   
}
/*
struct PostDetailledView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailledView(post : Post())
    }
}*/
