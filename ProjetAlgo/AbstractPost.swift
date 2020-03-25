//
//  AbstractPost.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/21/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import Foundation
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

class AbstractPost : ObservableObject{
    
    var id : String
    @Published var libelle : String
    @Published var likeTab : [String]
    @Published var dislikeTab : [String]
    var signalementTab : [String]
    var user : User
    var dateCreation : Date
    
    
    init (id : String, libelle : String , likeTab : [String], dislikeTab : [String],
          signalementTab : [String], user : User, dateCreation : Date){
        self.id = id
        self.libelle = libelle
        self.likeTab = likeTab
        self.dislikeTab = dislikeTab
        self.signalementTab = signalementTab
        self.user = user
        self.dateCreation = dateCreation
    }
    

    convenience init(){
        self.init(id : "", libelle : "", likeTab : [], dislikeTab : [], signalementTab : [], user : User(),dateCreation : Date())
    }
    
    func addLike(user : String){
        likeTab.append(user)
    }
    
    func deleteLike(user : String){
        var i = 0
        var delete = true
        while(delete || self.likeTab.count > i){
            print(i)
            if(self.likeTab[i] == user){
                self.likeTab.remove(at: i)
                delete = false
            }
            i = i+1
        }
    }
    
    func isLiked(user : String) -> Bool{
        var i = 0
        
        var b = true
         print(user)
        while(self.likeTab.count > 0 && b && self.likeTab.count > i){
            print(self.likeTab[i])
            
            if(self.likeTab[i] == user){
                b = false
            }
            i = i+1
        }
        print(!b)
        return !b
    }
    
    func addDislike(user : String){
        dislikeTab.append(user)
    }
    
    func deleteDislike(user : String){
        var i = 0
        var delete = true
        while(delete || self.dislikeTab.count > i){
            print(i)
            if(self.dislikeTab[i] == user){
                self.dislikeTab.remove(at: i)
                delete = false
            }
            i = i+1
        }
    }
    
    func isDisliked(user : String) -> Bool{
        var i = 0
        
        var b = true
         print(user)
        while(self.dislikeTab.count > 0 && b && self.dislikeTab.count > i){
            print(self.dislikeTab[i])
            
            if(self.dislikeTab[i] == user){
                b = false
            }
            i = i+1
        }
        print(!b)
        return !b
    }
    
    func addSignalement(user : String){
        signalementTab.append(user)
    }
    
    
    func deleteSignalement(user : String){
        var i = 0
        var delete = true
        while(delete || self.signalementTab.count > i){
            print(i)
            if(self.signalementTab[i] == user){
                self.signalementTab.remove(at: i)
                delete = false
            }
            i = i+1
        }
    }
    
    func isSignaled(user : String) -> Bool{
        var i = 0
        
        var b = true
         print(user)
        while(self.signalementTab.count > 0 && b && self.signalementTab.count > i){
            print(self.signalementTab[i])
            
            if(self.signalementTab[i] == user){
                b = false
            }
            i = i+1
        }
        print(!b)
        return !b
    }
    
    
    
    

    
}

