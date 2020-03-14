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
    
    
    var body: some View {
        
            
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

    }
   
}
/*
struct PostDetailledView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailledView(post : Post())
    }
}*/
