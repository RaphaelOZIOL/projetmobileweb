//
//  editPostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/17/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: userSettings
   // @ObservedObject var post:Post
    @State var categorie:Int = 0
    var cat : [String]
    @ObservedObject var postTab : PostSet
    @State var filterCateg : Bool

    var body: some View {
        
        return(
        Form{
    
            Section(header : Text("Filtrer votre post")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .bold())
            {
        
                HStack(alignment: .center){
                    
                    Picker(selection: $categorie, label: Text("Categorie")) {
                        ForEach(0 ..< cat.count) {
                            Text(self.cat[$0])

                        }
                    }
                    HStack{
                        Toggle(isOn: $filterCateg) {
                            Text("")
                        }.padding()
                        .onTapGesture {
                            if (!self.filterCateg) {
                              print("salut")
                          }
                        }
                        
                        
                    }
                }
        
            }
        }
        )
    }
}
/*
struct EditPostView_Previews: PreviewProvider {
    static var previews: some View {
        EditPostView()
    }
}
*/
