//
//  Reponse.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/25/20.
//  Copyright © 2020 user165002. All rights reserved.
//


import Foundation
import Combine
import SwiftUI

class Reponse : AbstractPost,Identifiable{
    
   
    
    override init (id: String, libelle : String , likeTab : [String], dislikeTab : [String],
          signalementTab : [String], user : User, dateCreation : Date){
    
        super.init(id : id, libelle : libelle , likeTab : likeTab, dislikeTab : dislikeTab,
        signalementTab : signalementTab, user : user, dateCreation : dateCreation)
    }
    
    convenience init(libelle : String){
        self.init(id : "",libelle : libelle, likeTab : [], dislikeTab : [], signalementTab : [], user : User(),dateCreation : Date())
    }
    

}
