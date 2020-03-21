//
//  LoginView.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/28/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
    
    @Binding var showMenu: Bool
    @EnvironmentObject var settings: userSettings
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    // MARK: - View
    var body: some View {
            VStack() {
                Text("Appli anti-sexiste")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding([.top, .bottom], 50)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                Image("IconPCS") // mettre le logo
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 25)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    SecureField("Mot de passe", text: self.$password)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding([.leading, .trailing], 27.5)
                
                Button(action: {
                    var reponse = RequestManager.loginRequest(email: self.email, pwd: self.password)
                    
                    if(reponse["token"] == nil){
                        print("mauvais mail ou pasword")
                    }
                    else{
                        print("REPONSE LOGIN")
                        print(reponse)
                        self.settings.token = reponse["token"] as! String
                        self.settings.nom = reponse["nom"] as! String
                        self.settings.prenom = reponse["prenom"] as! String
                        self.settings.id = reponse["_id"] as! String
                        
                        self.showMenu = false
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                    
                }) {
                    Text("Se Connecter")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 50)
                
                Button(action: {
                    //view s'inscrire
                }) {
                    NavigationLink(destination: SignUpView(showMenu : self.$showMenu)) {
                        Text("S'inscrire")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    }
                }.padding([.top, .bottom], 25)
                /*
                Spacer()
                    HStack(spacing: 0) {
                        Text("Vous n'avez pas de compte ?")
                        
                           
                            NavigationLink(destination: SignUpView(showMenu : self.$showMenu)) {
                                Text("S'inscrire")
                            }
                        
                    }
                */
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
                
                .padding(.bottom, keyboard.currentHeight)
                .edgesIgnoringSafeArea(.bottom)
                .animation(.easeOut(duration: 0.16))

        }
    
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}
/*
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
*/
