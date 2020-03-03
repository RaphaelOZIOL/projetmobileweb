//
//  UserSignView.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/2/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import SwiftUI

struct UserSignView: View {
    @State var firstname: String = ""
    var body: some View {
        Form{
        
            Section(header : Text("Inscription")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .bold()){
                    HStack(alignment: .center){
                        Text("first").multilineTextAlignment(.center)
                        TextField("Prénom", text: self.$firstname)
                    }
                    Text("Coucou")
            }
        }
    }
}

struct UserSignView_Previews: PreviewProvider {
    static var previews: some View {
        UserSignView()
    }
}
