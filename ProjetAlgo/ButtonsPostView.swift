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
    
    var body: some View {
        HStack{
            GeometryReader { geometry in
                HStack(alignment: .center){
                    Button(action : {
                        let reponse = RequestManager.addLikePost(postId: self.post.id, token: self.settings.token)
                        print()
                        if((reponse["text"] as! String) != "Succès"){
                            print("Déjà liker ou pas connecté")
                        }
                        else{
                            self.post.addLike(user : User(id: self.settings.id))
                        }
                    }){
                        HStack{
                            Image(systemName: "safari")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                
                            Text("J'aime")
                                .font(.subheadline)
                                .lineLimit(2)
                                .foregroundColor(.secondary)
                        }
                        .frame(width: geometry.size.width / 3, height: 100)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action : {
                        
                    }){
                        HStack{
                            Image(systemName: "safari")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text("Commenter")
                                .font(.subheadline)
                                .lineLimit(2)
                                
                                .foregroundColor(.secondary)
                                
                        }
                        .frame(width: geometry.size.width / 3, height: 100)
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action : {
                        
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
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}
/*
struct ButtonsPostView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsPostView(post : Post())
    }
}*/
