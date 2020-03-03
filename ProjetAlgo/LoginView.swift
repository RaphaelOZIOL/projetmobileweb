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
    // MARK: - View
    var body: some View {
        NavigationView{
            VStack() {
                Text("Appli anti-sexiste")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding([.top, .bottom], 40)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                Image("iosapptemplate") // mettre le logo
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 50)
                
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
                    var reponse = RequestManager.postRequest(url: RequestManager.urlLogin, postString: RequestManager.getPostStringLogin(email: self.email, password: self.password))
                    
                    if(reponse["token"] == nil){
                        print("mauvais mail ou pasword")
                    }
                    else{
                        self.settings.token = reponse["token"] as! String
                        self.settings.nom = reponse["nom"] as! String
                        self.settings.prenom = reponse["prenom"] as! String
                        self.showMenu.toggle()
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
                Spacer()
                    HStack(spacing: 0) {
                        Text("Vous n'avez pas de compte ?")
                        
                           
                            NavigationLink(destination: SignUpView()) {
                                Text("S'inscrire")
                            }
                        
                    }
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
        }
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
