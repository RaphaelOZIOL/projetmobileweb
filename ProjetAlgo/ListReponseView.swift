//
//  ListReponseView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct ListReponseView: View {
    var reponseList = [
          Reponse(),
          Reponse()
        ]
      
    var body: some View {
     
     VStack{
         List{
             ForEach(reponseList){rep in
                  ReponseRowView(reponse : rep)
                 
             }
         }
         Spacer()
         }

      }
    
}

struct ListReponseView_Previews: PreviewProvider {
    static var previews: some View {
        ListReponseView()
    }
}
