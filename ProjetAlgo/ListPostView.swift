
//
//  PostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/26/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI


struct ListPostView : View {
    
    @ObservedObject var postList : PostSet
    
  var body: some View {
  // NavigationView{
   VStack{
       List{
        ForEach(postList.postTab){post in
            
                PostRowView(post : post)
            
            
            
               
           }
       }
      // Spacer()
       }

    }
  //}
    
}
    
/*
struct ListPostView_Previews: PreviewProvider {
    static var previews: some View {
        ListPostView()
    }
}*/

