//
//  ListReponseView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct ListReponseView: View {
     @ObservedObject var reponseList : ReponseSet
       
     var body: some View {
     // NavigationView{
      VStack{
          List{
           ForEach(reponseList.reponseTab){reponse in
               
                   ReponseRowView(reponse : reponse)
               
               
               
                  
              }
          }
          //Spacer()
          }

       }
}
/*
struct ListReponseView_Previews: PreviewProvider {
    static var previews: some View {
        ListReponseView()
    }
}*/
