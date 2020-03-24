
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
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
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
    
    VStack {
        

        List {
            // Search view
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")

                    TextField("search", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        print("onCommit")
                    }).foregroundColor(.primary)

                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)

                if showCancelButton  {
                    Button("Cancel") {
                            self.searchText = ""
                            self.showCancelButton = false
                    }
                    .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(showCancelButton)
            // Filtered list of names
            ForEach(postList.postTab.filter{($0.libelle.lowercased().contains(searchText.lowercased()) || $0.description.lowercased().contains(searchText.lowercased())) || searchText == ""}){post in
               
               PostRowView(post : post, notifTab: self.notifList)
               
            
              }
        }
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

