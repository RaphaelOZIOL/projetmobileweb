//
//  PostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct PostRowView: View {
    
    var post : Post
    var libelle : String
    init(post: Post){
        self.post = post
        if post.reponses.count > 0{
            self.libelle = post.reponses[0].libelle
        }
        else{
            self.libelle = ""
        }
    }
    
    
    var body: some View {
        
        VStack{
            VStack{
                Text(post.libelle)
                    .bold()
                    .padding()
                Text(post.description)
                    .padding()
                VStack{
                HStack{
                Text(post.user.pseudo + "couocu")
                Text(post.dateCreation.description)
                }
            
            Text(self.post.reponses[0].libelle)
            HStack{
            Image(systemName: "safari")
            Image(systemName: "safari")
            Image(systemName: "safari")
            }
            }
            .background(Color.yellow)
                .cornerRadius(10)
        }
        .border(Color.blue,width: 2)
        .cornerRadius(10)
        .background(Color.gray)
    }
}
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(post: Post())
    }
}




