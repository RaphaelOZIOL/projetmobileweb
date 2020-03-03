//
//  ReponseRowView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct ReponseRowView: View {
    var reponse : Reponse
        
    var body: some View {
        
        VStack{
            VStack{
                Text(reponse.libelle)
                Text(reponse.pseudo)
                Text(reponse.dateCreation.description)
            }
           
            VStack{
            Image(systemName: "safari")
            Image(systemName: "safari")
            Image(systemName: "safari")
            }
            VStack{
            
            Image(systemName: "safari")
            Image(systemName: "safari")
            Image(systemName: "safari")
            }
        }
    }
}

struct ReponseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReponseRowView(reponse : Reponse())
    }
}
