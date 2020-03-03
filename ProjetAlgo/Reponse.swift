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

class Reponse : Identifiable, Codable{
    
    var libelle : String
    var likeTab : [User]
    var dislikeTab : [User]
    var signalementTab : [User]
    var pseudo : String
    var dateCreation : Date
    
   
    
    init (libelle : String , likeTab : [User], dislikeTab : [User],
          signalementTab : [User], pseudo : String, dateCreation : Date){
        
        self.libelle = libelle
        self.likeTab = likeTab
        self.dislikeTab = dislikeTab
        self.signalementTab = signalementTab
        self.pseudo = pseudo
        self.dateCreation = dateCreation
    }
    
    convenience init(){
        self.init(libelle : "", likeTab : [], dislikeTab : [], signalementTab : [], pseudo : "hugoleboss",dateCreation : Date())
    }
    

}
