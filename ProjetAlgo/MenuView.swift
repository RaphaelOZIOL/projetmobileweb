//
//  MenuView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/3/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    @EnvironmentObject var settings: userSettings
    
    var body: some View {
               
        if(settings.token == ""){
            return AnyView(VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    NavigationLink(destination: LoginView(showMenu : self.$showMenu)){
                        
                        Text("Se connecter")
                        .foregroundColor(.gray)
                        .font(.headline)
                        
                    }
                }
                    .padding(.top, 100)
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    //NavigationLink(destination: SignUpView(showMenu : self.$showMenu)){
                        Text("S'inscrire")
                            .foregroundColor(.gray)
                            .font(.headline)
                    //}
                }
                    .padding(.top, 30)
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Options")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                    .padding(.top, 30)
                Spacer()
            }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 32/255, green: 32/255, blue: 32/255))
            .edgesIgnoringSafeArea(.all)
            )
        }
        else{
            return AnyView(VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    NavigationLink(destination: LoginView(showMenu : self.$showMenu)){
                        
                        Text("Mon profil")
                        .foregroundColor(.gray)
                        .font(.headline)
                        
                    }
                }
                    .padding(.top, 100)
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Notifications")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                    .padding(.top, 30)
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Mes Posts")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                    .padding(.top, 30)
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Options")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                    .padding(.top, 30)
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Se déconnecter")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                    .padding(.top, 30)
                Spacer()
            }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 32/255, green: 32/255, blue: 32/255))
            .edgesIgnoringSafeArea(.all)
            )
        
        }
        
        
    }
}

/*struct MenuView_Previews: PreviewProvider {
    var showMenu: Bool = false
    static var previews: some View {
        MenuView(showMenu: showMenu)
    }
}
*/
