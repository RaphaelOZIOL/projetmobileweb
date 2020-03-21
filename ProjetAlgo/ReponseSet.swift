//
//  ReponseSet.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/21/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import Foundation

class ReponseSet : ObservableObject{
    
    @Published var reponseTab : [Reponse]
    
    init(reponseTab : [Reponse]){
        self.reponseTab = reponseTab
    }
    
    func add(reponse : Reponse){
        reponseTab.append(reponse)
    }
    
    func updateTab(reponseTab : [Reponse]){
        self.reponseTab = reponseTab
    }
}
