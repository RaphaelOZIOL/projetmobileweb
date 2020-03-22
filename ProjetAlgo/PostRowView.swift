//
//  PostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct PostRowView: View {
    
   
    @ObservedObject var post : Post
    @EnvironmentObject var settings: userSettings
    
    
    var body: some View {
        
            
        HStack {
            
            VStack (alignment: .leading){
                
                NavigationLink(destination: PostDetailledView(post : post)) {
                
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
                            VStack(alignment: .trailing, spacing: 5) {
                                
                                if(self.settings.notifTab.estPasVuByPost(postId: post.id)){
                                    Image(systemName: "person.crop.circle")
                                    .font(.subheadline)
                                    .padding(.top, 5)
                                    .foregroundColor(.secondary)
                                }
                                // A VOIR POUR SI PAS DE NOTIF
                                
                                
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
                    }.simultaneousGesture(TapGesture().onEnded{
                        
                        self.settings.notifTab.setEstVuByPost(postId: self.post.id)
                    })
                }.navigationBarTitle(Text("Fil d'actualité"))
                HStack{
                    if(self.settings.token != ""){
                        ButtonsPostView(post : post)
                    }
                }
            }
        }

    }
    
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(post : Post())
    }
}




