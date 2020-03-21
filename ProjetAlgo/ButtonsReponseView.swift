//
//  ButtonsPostView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/10/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct ButtonsReponseView: View {
    
    @ObservedObject var reponse : Reponse
    @EnvironmentObject var settings: userSettings
    @State var tmpMenu : Bool = false
    
    var body: some View {

            return AnyView(HStack{
                    GeometryReader { geometry in
                        HStack(alignment: .center){
                            Button(action : {
                            
                                if(!self.reponse.isLiked(user: self.settings.id) && !self.reponse.isDisliked(user: self.settings.id)){
                                    let reponse = RequestManager.addLikeReponse(reponseId: self.reponse.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté A")
                                    }
                                    else{
                                        self.reponse.addLike(user : self.settings.id)
                                    }
                                }
                                else{
                                    let reponse = RequestManager.deleteLikeReponse(reponseId: self.reponse.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté D")
                                    }
                                    else{
                                        self.reponse.deleteLike(user : self.settings.id)
                                    }
                                    
                                }
                                }){
                                HStack{
                                    Image(systemName: "safari")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        
                                    Text("J'aime")
                                        .font(.subheadline)
                                        .lineLimit(2)
                                        .foregroundColor(.secondary)
                                }
                                .frame(width: geometry.size.width / 3, height: 100)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action : {
                                if(!self.reponse.isDisliked(user: self.settings.id) && !self.reponse.isLiked(user: self.settings.id)){
                                    let reponse = RequestManager.addDislikeReponse(reponseId: self.reponse.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté A")
                                    }
                                    else{
                                        self.reponse.addDislike(user : self.settings.id)
                                    }
                                }
                                else{
                                    let reponse = RequestManager.deleteDislikeReponse(reponseId: self.reponse.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté D")
                                    }
                                    else{
                                        self.reponse.deleteDislike(user : self.settings.id)
                                    }
                                    
                                }
                                
                            }){
                                HStack{
                                    Image(systemName: "safari")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    Text("J'aime pas")
                                        .font(.subheadline)
                                        .lineLimit(2)
                                        
                                        .foregroundColor(.secondary)
                                        
                                }
                                .frame(width: geometry.size.width / 3, height: 100)
                            }
                            .buttonStyle(PlainButtonStyle())
                            Button(action : {
                                                    
                                if(!self.reponse.isSignaled(user: self.settings.id)){
                                    let reponse = RequestManager.addSignalementReponse(reponseId: self.reponse.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté A")
                                    }
                                    else{
                                        self.reponse.addSignalement(user : self.settings.id)
                                    }
                                }
                                else{
                                    let reponse = RequestManager.deleteSignalementReponse(reponseId: self.reponse.id, token: self.settings.token)
                                    print()
                                    if((reponse["text"] as! String) != "Succès"){
                                        
                                        print("Pas connecté D")
                                    }
                                    else{
                                        self.reponse.deleteSignalement(user : self.settings.id)
                                    }
                                    
                                }
                            }){
                                HStack{
                                    Image(systemName: "safari")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                                       
                                    Text("Signaler")
                                        .font(.subheadline)
                                        .lineLimit(2)
                                                           
                                        .foregroundColor(.secondary)
                                                           
                                }
                                .frame(width: geometry.size.width / 3, height: 100)
                            }
                            .buttonStyle(PlainButtonStyle())
                        } //HSTACK
                    }
                }
            )
        
    }
}
/*
struct ButtonsPostView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsPostView(post : Post())
    }
}*/
