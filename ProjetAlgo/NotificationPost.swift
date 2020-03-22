//
//  Notification.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/25/20.
//  Copyright © 2020 user165002. All rights reserved.
//


import Foundation
import Combine
import SwiftUI

class NotificationPost : Identifiable{
    
    var id: String
    var post : Post
    var estVu : Bool
    var dateCreation : Date
    
    init (id : String, post : Post , estVu : Bool, dateCreation : Date){
        self.id = id
        self.post = post
        self.estVu = estVu
        self.dateCreation = dateCreation
    }
    
    convenience init(){
        self.init(id : "", post : Post(), estVu : false, dateCreation : Date())
    }
    
}
