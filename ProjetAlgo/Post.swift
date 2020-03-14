//
//  Post.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/25/20.
//  Copyright © 2020 user165002. All rights reserved.
//


import Foundation
import Combine
import SwiftUI

class Post : Identifiable,ObservableObject{
    
    var id: String
    var description: String
    var libelle : String
    var categ : String
    @Published var likeTab : [User]
    var dislikeTab : [User]
    var signalementTab : [User]
    var user : User
    var reponses : [Reponse]
    var dateCreation : Date
    
    
    init (id : String, description : String , libelle : String, categ : String, likeTab : [User], dislikeTab : [User], signalementTab : [User], user : User, reponses : [Reponse], dateCreation : Date){
        
        self.id = id
        self.description = description
        self.libelle = libelle
        self.categ = categ
        self.likeTab = likeTab
        self.dislikeTab = dislikeTab
        self.signalementTab = signalementTab
        self.user = user
        self.reponses = reponses
        self.dateCreation = dateCreation
    }
    

    convenience init(){
        self.init(id: "0", description: "harcelement dans le métro", libelle: "Je me suis faite insultée dans le métro", categ: "harcèlement", likeTab: [User()], dislikeTab: [], signalementTab: [User()], user: User(), reponses: [Reponse()], dateCreation: Date())
    }
    
    func addLike(user : User){
        likeTab.append(user)
    }

    
}

