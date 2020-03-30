//
//  ReponseRowView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct ReponseRowView: View {
    @ObservedObject var reponse : Reponse
    @EnvironmentObject var settings: userSettings
        
    var body: some View {
        
        HStack {
            
            VStack (alignment: .leading){
                
                
                    VStack (alignment: .leading){
                        HStack() {
                            Image(systemName: "person.crop.circle")
                                .font(.subheadline)
                                .padding(.top, 5)
                                .foregroundColor(.secondary)

                            VStack(alignment: .leading, spacing: 5) {
                                /*Text(reponse.libelle)
                                    .font(.headline)
                                    .lineLimit(2)
                                    .layoutPriority(1000)*/

                                Text(RequestManager.getStringDate(d:  reponse.dateCreation)) // Date
                                    .font(.caption)
                                    
                                    .lineLimit(nil)
                                    .layoutPriority(999)
                            }
                            
                            
                        }
                        .padding(.leading, 5)
                        .padding([.top, .bottom], 10)
                        
                        VStack(){
                            Text(reponse.libelle) // Date
                            .font(.caption)
                                
                            .lineLimit(nil)
                            .layoutPriority(999)
                            
                        }
                        
                        StarContainerReponseView(reponse : reponse)
                    }
                
                HStack{
                    if(self.settings.token != ""){
                        ButtonsReponseView(reponse : reponse)
                    }
                }
            }
        }
    }
}
/*
struct ReponseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReponseRowView(reponse : Reponse())
    }
}*/
