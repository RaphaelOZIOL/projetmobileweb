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
                Text(post.description)
                Text(post.user.pseudo)
                Text(post.dateCreation.description)
            }
            Text(self.post.reponses[0].libelle)
            VStack{
            Image(systemName: "safari")
            Image(systemName: "safari")
            Image(systemName: "safari")
            }
            VStack{
            
            Image(systemName: "safari")
            Image(systemName: "safari")
            Image(systemName: "safari")
            }
        }
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(post: Post())
    }
}




