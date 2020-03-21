//
//  StarContainerView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/21/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct StarContainerReponseView: View {
    @ObservedObject var reponse : Reponse
     

    var body: some View {
        HStack(alignment: .center) {
            HStack(alignment: .center) {
             Text(reponse.likeTab.count.description)
                    .padding(.top, 2)

                Image(systemName: "star.fill")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            .padding(.leading, 10)
         Spacer()
             HStack(alignment: .center) {
              Text(reponse.dislikeTab.count.description)
                     .padding(.top, 2)

                 Image(systemName: "star.fill")
                     .font(.subheadline)
                     .foregroundColor(.red)
             }
             .padding(.leading, 10)
        }
    }
}
/*
struct StarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StarContainerView()
    }
}
*/
