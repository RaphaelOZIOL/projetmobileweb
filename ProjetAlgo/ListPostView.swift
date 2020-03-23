
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
    @ObservedObject var notifList : NotificationSet
    
    init(postList : PostSet, token : String){
        self.postList = postList
        if(token != ""){
            self.notifList = RequestManager.getAllNotification(url : URL(string: RequestManager.urlGetAllNotification!.absoluteString + token)!)
        }
        else{
            self.notifList = NotificationSet(notifTab: [])
        }
    }
    
  var body: some View {
  // NavigationView{
   VStack{
       List{
        ForEach(postList.postTab){post in
            
            PostRowView(post : post, notifTab: self.notifList)
            
            
            
               
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

