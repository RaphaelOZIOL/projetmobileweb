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
    @EnvironmentObject var settings: userSettings
    var cat = ["Personel","Livre","Film","Humour","Citation","Réseaux","Autre"]
        
    
    
    var body: some View {
        var categorie:Int = 0
        let c = cat.count
        for i in 0..<c {
            if(cat[i] == post.categ){
                categorie = i
            }
        }
        if(settings.id == post.user.id.description){
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
                         
                         StarContainerView(post : post)
                     }
                 
                     
                 ButtonsPostView(post : post)
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
                            
                            StarContainerView(post : post)
                        }
                    
                        
                    ButtonsPostView(post : post)
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
