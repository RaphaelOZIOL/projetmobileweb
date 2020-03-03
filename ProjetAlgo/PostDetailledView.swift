//
//  PostDetailledView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct PostDetailledView: View {
    
    var post : Post
    
    
    
    var body: some View {
        VStack{
            VStack{
                Text(post.libelle)
                Text(post.description)
                Text(post.user.pseudo)
                Text(post.dateCreation.description)
            }
            List{
                
                ForEach(post.reponses){reponse in
                
                    ReponseRowView(reponse : reponse)
      
              }
            }
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

struct PostDetailledView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailledView(post : Post())
    }
}
