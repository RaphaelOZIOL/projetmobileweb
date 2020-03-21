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

class Post : AbstractPost, Identifiable{
    
    var description: String
    var categ : String
    var reponses : [Reponse]
    
    
    init (id : String, description : String , libelle : String, categ : String, likeTab : [String], dislikeTab : [String], signalementTab : [String], user : User, reponses : [Reponse], dateCreation : Date){
        self.description = description
        self.categ = categ

        self.reponses = reponses
        super.init(id : id, libelle : libelle , likeTab : likeTab, dislikeTab : dislikeTab,
        signalementTab : signalementTab, user : user, dateCreation : dateCreation)
        

    }
    

    convenience init(){
        self.init(id: "0", description: "harcelement dans le métro", libelle: "Je me suis faite insultée dans le métro", categ: "harcèlement", likeTab: [], dislikeTab: [], signalementTab: [], user: User(), reponses: [Reponse()], dateCreation: Date())
    }
    
    func addReponse(reponse : Reponse){
        reponses.append(reponse)
    }
    
    func deleteReponse(reponse : Reponse){
        for i in 0..<self.reponses.count {
            if(self.reponses[i].id == user.id){
                self.reponses.remove(at: i)
            }
        }
    }

    
}

