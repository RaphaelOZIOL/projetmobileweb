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
    @State var filterCateg : Bool = false
    @State var filterPostEntendu : Bool = false
    @State var filterPostPlusReponse : Bool = false
    
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
            
                                self.postTab.filterByCateg(categ: self.cat[self.categorie])
                          }
                        }
                        
                        
                    }
                }
                
                HStack(alignment: .center){
                        
                        Text("Les posts les plus entendus")
                            
                        
                        HStack{
                            Toggle(isOn: $filterPostEntendu) {
                                Text("")
                            }.padding()
                            .onTapGesture {
                                if (!self.filterPostEntendu) {
                                    print("salut")
                
                                    self.postTab.filterByLike()
                              }
                            }
                            
                            
                        }
                    }
                HStack(alignment: .center){
                        
                        Text("Les posts avec le plus de réponses")
                            
                        
                        HStack{
                            Toggle(isOn: $filterPostPlusReponse) {
                                Text("")
                            }.padding()
                            .onTapGesture {
                                if (!self.filterPostPlusReponse) {
                                    print("salut")
                
                                    self.postTab.filterByNbReponse()
                              }
                            }
                            
                            
                        }
                    }
        
            }
        }
        )
        .onAppear(perform: loadData)
    }
    
    
    func loadData(){
        self.filterCateg = false
        self.postTab.updateTab(postTab: RequestManager.getAllPost(url : RequestManager.urlGetAllPost!).postTab)
        
    }
}
/*
struct EditPostView_Previews: PreviewProvider {
    static var previews: some View {
        EditPostView()
    }
}
*/
