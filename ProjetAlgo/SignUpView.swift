//
//  SignUpView.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/28/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Binding var showMenu: Bool
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: userSettings
    
    @State var firstname : String = ""
    @State var lastname : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var confPassword : String = ""
    @State var pseudo : String = ""
    @State var adress : String = ""
    @State var tel : String = ""
    @State var birthday : Date = Date()
    
    var body: some View {
            Form{
        
            Section(header : Text("Inscription")
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
                Text("mot de passe : ")
                    .multilineTextAlignment(.center)
                TextField("mot de passe", text: $password)
            }
            HStack(alignment: .center){
                Text("mot de passe : ")
                    .multilineTextAlignment(.center)
                TextField("mot de", text: $confPassword)
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
                let tabNotif: NotificationSet = NotificationSet(notifTab: [])
                let user = User(id: "0", email: self.email, password: self.password, pseudo: self.pseudo, firstname: self.firstname, lastname: self.lastname, birthday: self.birthday, notifTab: tabNotif, adress: self.adress, tel: self.tel, isAdmin: false)
                

                var reponse = RequestManager.signUpRequest(user: user)
                
                if(reponse["token"] == nil){
                    print("mauvais mail ou pasword")
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
                Text("S'inscrire")
            }
                }
            }
        }
        
        
        
}
/*
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}*/
