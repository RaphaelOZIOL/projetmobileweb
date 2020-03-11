//
//  ButtonsPostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/10/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct ButtonsPostView: View {
    var post : Post
    @EnvironmentObject var settings: userSettings
    var body: some View {
        HStack{
            GeometryReader { geometry in
                HStack(alignment: .center){
                    Button(action : {
                        RequestManager.addLikePost(postId: self.post.id, token: self.settings.token)
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

struct ButtonsPostView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsPostView(post : Post())
    }
}
