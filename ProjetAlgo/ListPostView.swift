
//
//  PostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/26/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI


struct ListPostView : View {
    
    var postList = [ // appeler la requete get pour chopper les post
        Post()
      ]
    
  var body: some View {
  // NavigationView{
   VStack{
       List{
           ForEach(postList){post in
            NavigationLink(destination: PostDetailledView(post : post)){
                PostRowView(post : post)
               }
               
           }
       }
       Spacer()
       }.navigationBarTitle(Text(""))

    }
  //}
    
}
    

struct ListPostView_Previews: PreviewProvider {
    static var previews: some View {
        ListPostView()
    }
}

