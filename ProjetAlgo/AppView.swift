//
//  AccueilView.swift
//  ProjetAlgo
    //
//  Created by user165002 on 3/3/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI
import Combine

struct AppView: View{
    @State var showMenu = false
    
    @EnvironmentObject var settings: userSettings
    
    var body: some View {
        let drag = DragGesture()
            .onEnded{
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
        }
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    AccueilView(showMenu : self.$showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .disabled(self.showMenu ? true : false)
                    
                    if self.showMenu {
                        MenuView(showMenu : self.$showMenu).frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }.gesture(drag)
            }
            .navigationBarTitle("Fil d'actualité", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
                ))
        }
        
        
    }
}

struct AccueilView: View {
    @Binding var showMenu: Bool
    
    @EnvironmentObject var settings: userSettings
    
    var body: some View {
            VStack{
                Button(action: {
                    withAnimation{
                        self.showMenu = true
                    }
                    
                }) {
                    Text("Bienvenu " + self.settings.nom + " " + self.settings.prenom)
                    }
            }
    }
}



struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

