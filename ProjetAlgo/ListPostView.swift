
//
//  PostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/26/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI


struct ListPostView : View{

    

    @ObservedObject var postList : PostSet
    @ObservedObject var notifList : NotificationSet
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    //@State var filterCateg: Bool = false
    init(postList : PostSet, token : String){
        self.postList = postList
        
        if(token != ""){
            print(token)
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
            GeometryReader { geometry in
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("search", text: self.$searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(self.searchText == "" ? 0 : 1)
                        }
                        .buttonStyle(PlainButtonStyle())

                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    .frame(width: geometry.size.width * 0.8, height: 100)

                  /*  if self.showCancelButton  {
                        Button("Cancel") {
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                        .frame(width: geometry.size.width * 0.2, height: 100)
                        .buttonStyle(PlainButtonStyle())
                    }*/
                    
                    HStack(){
                        NavigationLink(destination: FilterView(cat : RequestManager.getAllCategorie(url: RequestManager.urlGetAllCategorie!), postTab : self.postList/*, filterCateg: self.$filterCateg*/)){
                            Text("Filtre")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            //.frame(width: geometry.size.width * 0.2, height: 100)
                            .frame(width: 80, height: 40)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                        }
                    }
                    .frame(width: geometry.size.width * 0.2, height: 100)
                    
                    
                    
                }
                .padding(.horizontal)
                .navigationBarHidden(self.showCancelButton)
            }
            
            // Filtered list of names
            ForEach(postList.postTab.filter{($0.libelle.lowercased().contains(searchText.lowercased()) || $0.description.lowercased().contains(searchText.lowercased())) || searchText == ""}){post in
               
                PostRowView(post : post, notifTab: self.notifList, postList : self.postList)
               
            
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

