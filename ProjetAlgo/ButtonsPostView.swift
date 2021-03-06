//
//  ButtonsPostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/10/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct ButtonsPostView: View {
    @ObservedObject var post : Post
    @EnvironmentObject var settings: userSettings
    @State var tmpMenu : Bool = false
    
    var body: some View {

            return AnyView(HStack{
                    GeometryReader { geometry in
                        HStack(alignment: .center){
                            Button(action : {
                            
                                if(!self.post.isLiked(user: self.settings.id) && !self.post.isDisliked(user: self.settings.id)){
                                    let reponse = RequestManager.addLikePost(postId: self.post.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté A")
                                    }
                                    else{
                                        self.post.addLike(user : self.settings.id)
                                    }
                                }
                                else{
                                    let reponse = RequestManager.deleteLikePost(postId: self.post.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté D")
                                    }
                                    else{
                                        self.post.deleteLike(user : self.settings.id)
                                    }
                                    
                                }
                            }){
                            
                                HStack{
                                    Text(self.post.likeTab.count.description)
                                     .fontWeight(.semibold)
                                     .font(.title)
                                    
                                    Text("fois entendu    ")
                                       // .fontWeight(.semibold)
                                       // .font(.title)
                                       // .padding(.bottom, 20)
                                        
                                      //  .foregroundColor(.secondary)
                                    
                                   
                                        
                                }
                                .frame(minWidth: 0, maxWidth: geometry.size.width / 2)
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [Color("Darkgreen"), Color("Lightgreen")]), startPoint: .leading, endPoint: .trailing))
                               // .padding(.bottom, 30)
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(40)
                                //.frame(width: geometry.size.width / 2, height: 100)
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action : {
                                if(!self.post.isDisliked(user: self.settings.id) && !self.post.isLiked(user: self.settings.id)){
                                    let reponse = RequestManager.addDislikePost(postId: self.post.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté A")
                                    }
                                    else{
                                        self.post.addDislike(user : self.settings.id)
                                    }
                                }
                                else{
                                    let reponse = RequestManager.deleteDislikePost(postId: self.post.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté D")
                                    }
                                    else{
                                        self.post.deleteDislike(user : self.settings.id)
                                    }
                                    
                                }
                                
                            }){
                                HStack{
                                    Text(self.post.dislikeTab.count.description)
                                     .fontWeight(.semibold)
                                     .font(.title)
                                    
                                    Text("fois pas entendu")
                                       // .fontWeight(.semibold)
                                       // .font(.title)
                                        
                                        
                                      //  .foregroundColor(.secondary)
                                    
                                   
                                        
                                }
                                .frame(minWidth: 0, maxWidth: geometry.size.width / 2)
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [Color("Darkred"), Color("Lightred")]), startPoint: .leading, endPoint: .trailing))
                                
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(40)
                                //.frame(width: geometry.size.width / 2, height: 100)
                            }
                            .buttonStyle(PlainButtonStyle())
                           /* Button(action : {
                                                    
                                if(!self.post.isSignaled(user: self.settings.id)){
                                    let reponse = RequestManager.addSignalementPost(postId: self.post.id, token: self.settings.token)
                
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté A")
                                    }
                                    else{
                                        self.post.addSignalement(user : self.settings.id)
                                    }
                                }
                                else{
                                    let reponse = RequestManager.deleteSignalementPost(postId: self.post.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté D")
                                    }
                                    else{
                                        self.post.deleteSignalement(user : self.settings.id)
                                    }
                                    
                                }
                            }){
                                HStack{
                                    Image(systemName: "safari")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                                       
                                    Text("Signaler")
                                        .font(.subheadline)
                                        .lineLimit(2)
                                                           
                                        .foregroundColor(.secondary)
                                                           
                                }
                                .frame(width: geometry.size.width / 3, height: 100)
                            }
                            .buttonStyle(PlainButtonStyle())*/
                        } //HSTACK
                    }
                }
            )
        
    }
}
/*
struct ButtonsPostView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsPostView(post : Post())
    }
}*/
