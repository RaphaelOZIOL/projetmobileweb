//
//  SignUpView.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/28/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    //@Binding var showMenu: Bool 
    
    @State var firstname : String = ""
    @State var name : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var confPassword : String = ""
    @State var pseudo : String = ""
    @State var adress : String = ""
    //@State var tel : Int = 0606060606
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
                //TextField("Prénom", text: $firstname)
            }
            HStack(alignment: .center){
                Text("Nom : ")
                    .multilineTextAlignment(.center)
                TextField("Nom", text: $name)
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
//            HStack(alignment: .center){
//                Text("téléphone : ")
//                    .multilineTextAlignment(.center)
//                TextField("téléphone", text: $tel)
//            }
            HStack(alignment: .center){

                DatePicker(selection: $birthday, label: { Text("Date de naissance :") })
            }

            Button(action: add
               /* let tabNotif = []
                let user = User(email: email, password: password, pseudo: pseudo, firstname: firstname, lastname: lastname, birthday: birthday, notifTab: tabNotif, adress: adress, tel: tel, isAdmin: false)
                */

              //  pFetcher.addPersonJSON(person: //person)*/

               // self.presentationMode.wrappedValue.dismiss()
            ) {
                Text("Ajouter")
            }
                }
            }
        }
        
        
        
    
    func add(){
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
