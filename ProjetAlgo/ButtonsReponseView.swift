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

            Text("salut")
        
    }
}
/*
struct ButtonsPostView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsPostView(post : Post())
    }
}*/
