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

class User : Identifiable,Codable{
    
    var id : Int
    var email : String
    var password : String
    var pseudo : String
    var firstname : String
    var lastname : String
    var birthday : Date
    var notifTab : [Notification]
    var adress : String
    var tel : String
    var isAdmin : Bool
        
    
    
    init (id : Int, email : String , password : String, pseudo : String, firstname : String, lastname : String, birthday : Date, notifTab : [Notification], adress : String, tel : String, isAdmin : Bool){
        
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
    
    convenience init(){
        self.init(id: 0, email: "", password: "", pseudo: "hugo le boss", firstname: "", lastname: "", birthday: Date(), notifTab: [], adress: "", tel: "", isAdmin: false)
    }
}

