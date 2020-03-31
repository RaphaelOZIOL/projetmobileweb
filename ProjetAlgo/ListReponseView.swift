//
//  ListReponseView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct ListReponseView: View {
    @ObservedObject var reponseList : ReponseSet
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    
       
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

                    
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton)
                // Filtered list of names
                ForEach(reponseList.reponseTab.filter{$0.libelle.lowercased().contains(searchText.lowercased()) || searchText == ""}){reponse in
                   
                    ReponseRowView(reponse : reponse)
                   
                
                  }
            }
        }        

       }
}
/*
struct ListReponseView_Previews: PreviewProvider {
    static var previews: some View {
        ListReponseView()
    }
}*/
