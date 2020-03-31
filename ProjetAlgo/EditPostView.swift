//
//  editPostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/17/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct EditPostView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: userSettings
    @ObservedObject var post:Post
    @State var categorie:Int
    var cat : [String]
    @ObservedObject var postTab : PostSet

    var body: some View {
        
        return(
        Form{
    
        Section(header : Text("Modifier votre post")
            .font(.largeTitle)
            .foregroundColor(Color.blue)
            .bold()){
        HStack(alignment: .center){
            Text("Titre : ")
                .multilineTextAlignment(.center)
            TextField("Titre", text: $post.description)
        }
        HStack(alignment: .center){
            Text("Contenu : ")
                .multilineTextAlignment(.center)
            TextField("Contenu", text: $post.libelle)
                .frame(height: 200)
        }
        HStack(alignment: .center){
            Text("Categorie : ")
                .multilineTextAlignment(.center)
            Picker(selection: $categorie, label: Text("Categorie")) {
                ForEach(0 ..< cat.count) {
                    Text(self.cat[$0])

                }
            }
        }
        Button(action: {
            
            self.post.categ = self.cat[self.categorie]
            print(self.post)
            var r = RequestManager.updatePost(post: self.post, token : self.settings.token)
                
                if(r["text"] as! String != "Succès"){
                    print("La requete a echoué")
                }
                else{
                    self.postTab.updatePost(post: self.post)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Modifier")
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
