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

class Notification : Identifiable,Codable{
    
    var id: Int
    var post : Post
    var estVu : Bool
    var dateCreation : Date
    
    init (post : Post , estVu : Bool, id : Int, dateCreation : Date){
        self.id = id
        self.post = post
        self.estVu = estVu
        self.dateCreation = dateCreation
    }
    
    convenience init(){
        self.init(post : Post(), estVu : true, id : 2, dateCreation : Date())
    }
    
}
