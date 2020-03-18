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
    @ObservedObject var postList = RequestManager.getAllPost(url : RequestManager.urlGetAllPost!)
    @EnvironmentObject var settings: userSettings
    
    var body: some View {
        let drag = DragGesture()
            .onEnded{
                if $0.translation.width > -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
        }
        
        if(settings.token == ""){
            return AnyView(NavigationView {
                    GeometryReader { geometry in
                        ZStack(alignment: .trailing) {
                            AccueilView(showMenu : self.$showMenu, postList : self.postList)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .disabled(self.showMenu ? true : false)
                            
                            if self.showMenu {
                                MenuView(postList : self.postList ,showMenu : self.$showMenu).frame(width: geometry.size.width/2)
                                    .transition(.move(edge: .trailing))
                            }
                        }.gesture(drag)
                    }
                    .navigationBarTitle("Fil d'actualité", displayMode: .inline)
                    .navigationBarItems(
                        leading: (
                            NavigationLink(destination: LoginView(showMenu : self.$showMenu)){
                                
                                    Image(systemName: "message")
                                        .imageScale(.large)

                                
                            }
                        
                        ),
                        trailing: (
                        Button(action: {
                            withAnimation {
                                self.showMenu.toggle()
                            }
                        }) {
                            Image(systemName: "person.crop.circle")
                                .imageScale(.large)
                        }
                        ))
                }
            )
        }
        else{
            return AnyView(NavigationView {
                    GeometryReader { geometry in
                        ZStack(alignment: .trailing) {
                            AccueilView(showMenu : self.$showMenu, postList : self.postList)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .disabled(self.showMenu ? true : false)
                            
                            if self.showMenu {
                                MenuView(postList : self.postList ,showMenu : self.$showMenu).frame(width: geometry.size.width/2)
                                    .transition(.move(edge: .trailing))
                            }
                        }.gesture(drag)
                    }
                    .navigationBarTitle("Fil d'actualité", displayMode: .inline)
                    .navigationBarItems(
                        leading: (
                            NavigationLink(destination: CreatePostView(showMenu : self.$showMenu, postList : self.postList)){
                                Image(systemName: "message")
                                    .imageScale(.large)
                            }
                        ),
                        
                        trailing: (
                            
                            Button(action: {
                            withAnimation {
                                self.showMenu.toggle()
                            }
                        }) {
                            Image(systemName: "person.crop.circle")
                                .imageScale(.large)
                        }
                                
                            
                            
                        ))
                }
            )
        }
        
    }
}

struct AccueilView: View {
    @Binding var showMenu: Bool
    @ObservedObject var postList : PostSet
    @EnvironmentObject var settings: userSettings
    
    var body: some View {
            VStack{
                ListPostView(postList : postList)
            }
    }
}


/*
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
*/
