//
//  User.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/25/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class User : Identifiable{
    
    var id : String
    var email : String
    var password : String
    var pseudo : String
    var firstname : String
    var lastname : String
    var birthday : Date
    var notifTab : NotificationSet
    var adress : String
    var tel : String
    var isAdmin : Bool
        
    
    
    init (id : String, email : String , password : String, pseudo : String, firstname : String, lastname : String, birthday : Date, notifTab : NotificationSet, adress : String, tel : String, isAdmin : Bool){
        
        self.id = id
        self.email = email
        self.password = password
        self.pseudo = pseudo
        self.firstname = firstname
        self.lastname = lastname
        self.birthday = birthday
        self.notifTab = notifTab
        self.adress = adress
        self.tel = tel
        self.isAdmin = isAdmin
    }
    
    convenience init(email : String , pseudo : String, firstname : String, lastname : String, birthday : Date, adress : String, tel : String){
        self.init(id: "0", email: email, password: "", pseudo: pseudo, firstname: firstname, lastname: lastname, birthday:birthday, notifTab: NotificationSet(notifTab: []), adress: adress, tel: tel, isAdmin: false)
    }
    
    convenience init(){
        self.init(id: "0", email: "", password: "", pseudo: "", firstname: "", lastname: "", birthday: Date(), notifTab: NotificationSet(notifTab: []), adress: "", tel: "", isAdmin: false)
    }
    
    convenience init(id : String, pseudo : String){
        self.init(id: id, email: "", password: "", pseudo: pseudo, firstname: "", lastname: "", birthday: Date(), notifTab: NotificationSet(notifTab: []), adress: "", tel: "", isAdmin: false)
    }
    convenience init(id : String){
        self.init(id: id, email: "", password: "", pseudo: "", firstname: "", lastname: "", birthday: Date(), notifTab: NotificationSet(notifTab: []), adress: "", tel: "", isAdmin: false)
    }
    
}

