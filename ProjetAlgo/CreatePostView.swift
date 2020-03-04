//
//  createPostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/4/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct CreatePostView: View {
    @Binding var showMenu: Bool
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: userSettings
    
    @State var description : String = ""
    @State var libelle : String = ""
    @State var categorie = 0
    
    var cat = ["Personel","Livre","Film","Humour","Citation","Réseaux"]
    
    
    var body: some View {
        Form{
    
        Section(header : Text("Création d'un post")
            .font(.largeTitle)
            .foregroundColor(Color.blue)
            .bold()){
        HStack(alignment: .center){
            Text("Titre : ")
                .multilineTextAlignment(.center)
            TextField("Titre", text: $description)
        }
        HStack(alignment: .center){
            Text("Contenu : ")
                .multilineTextAlignment(.center)
            TextField("Contenu", text: $libelle)
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
            let likeTab: [User] = []
            let disLikeTab: [User] = []
            let signalementTab: [User] = []
            let reponse: [Reponse] = []
            let post = Post(id: 0, description: self.description, libelle: self.libelle, categ: self.cat[self.categorie], likeTab: likeTab, dislikeTab: disLikeTab, signalementTab: signalementTab, user: User(), reponses: reponse, dateCreation: Date())
                

            var r = RequestManager.createPost(post: post, token : self.settings.token)
                
                if(r["text"] as! String != "Succès"){
                    print("La requete a echoué")
                }
                else{
                    self.showMenu = false
                    self.presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Poster")
            }
                }
            }
        }
}
/*
struct createPostView_Previews: PreviewProvider {
    static var previews: some View {
        createPostView()
    }
}
*/
