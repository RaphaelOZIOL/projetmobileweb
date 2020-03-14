//
//  ProfilView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/5/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct ProfilView: View {
    @Binding var showMenu: Bool
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: userSettings
    
    
    @State var firstname : String = ""
    @State var lastname : String = ""
    @State var email : String = ""
    @State var pseudo : String = ""
    @State var adress : String = ""
    @State var tel : String = ""
    @State var birthday : Date = Date()
    
    var body: some View {
        
        
            Form{
        
            Section(header : Text("Mon profil")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .bold()){
            HStack(alignment: .center){
                Text("Prénom : ")
                    .multilineTextAlignment(.center)
                TextField("Prénom", text: $lastname)
            }
            HStack(alignment: .center){
                Text("Nom : ")
                    .multilineTextAlignment(.center)
                TextField("Nom", text: $firstname)
            }
            HStack(alignment: .center){
                Text("email : ")
                    .multilineTextAlignment(.center)
                TextField("email", text: $email)
            }
            
            HStack(alignment: .center){
                Text("pseudo : ")
                    .multilineTextAlignment(.center)
                TextField("pseudo", text: $pseudo)
            }
            HStack(alignment: .center){
                Text("adresse : ")
                    .multilineTextAlignment(.center)
                TextField("adresse", text: $adress)
            }
            HStack(alignment: .center){
                Text("téléphone : ")
                    .multilineTextAlignment(.center)
                TextField("téléphone", text: $tel)
            }
            HStack(alignment: .center){
                DatePicker(selection: $birthday, in: Date()..., displayedComponents: .date, label: { Text("Date de naissance :") })
            }

            Button(action: {
                let tabNotif: [NotificationPost] = []
                let user = User(id: "0", email: self.email, password: "", pseudo: self.pseudo, firstname: self.firstname, lastname: self.lastname, birthday: self.birthday, notifTab: tabNotif, adress: self.adress, tel: self.tel, isAdmin: false)
                

                var reponse = RequestManager.updateUserRequest(user: user, token : self.settings.token)
                
                if(reponse["token"] == nil){
                    print("Une erreur est survenue")
                }
                else{
                    self.settings.token = reponse["token"] as! String
                    self.settings.nom = reponse["nom"] as! String
                    self.settings.prenom = reponse["prenom"] as! String
                    self.settings.id = reponse["_id"] as! String
                    self.showMenu = false
                    self.presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Modifier")
            }
                }
            }
            .onAppear(perform: loadData)
            
    }
        
    func loadData(){
        
        var user = RequestManager.getUser(token : self.settings.token)
        self.email = user.email
        self.lastname = user.lastname
        self.firstname = user.firstname
        self.pseudo = user.pseudo
        self.adress = user.adress
        self.tel = user.tel
        self.birthday = user.birthday
    }
        
}
/*
struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}*/
