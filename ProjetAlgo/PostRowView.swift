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
    @ObservedObject var notifTab : NotificationSet
    @ObservedObject var postList : PostSet
    @EnvironmentObject var settings: userSettings
    
    init(post : Post, notifTab : NotificationSet, postList : PostSet){
        self.post = post
        self.notifTab = notifTab
        self.postList = postList
    }
    
    var body: some View {
            HStack {
                
                VStack (alignment: .leading){
                
                    
                    NavigationLink(destination: PostDetailledView(post : post, notifTab : self.notifTab, postTab: self.postList)) {
                        
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
                                        
                                        .lineLimit(nil)
                                        .layoutPriority(999)
                                }
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
                       
                    }.navigationBarTitle(Text("Fil d'actualité"))
                    HStack{
                        if(self.settings.token != ""){
                            ButtonsPostView(post : post)
                                .padding(.bottom,30)
                        }
                        else{
                            ButtonsPostNoConnectedView(post : post)
                            .padding(.bottom,30)
                        }
                    }
                }
            }
            
        
        

    }
    
}
/*
struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(post : Post())
    }
}*/




