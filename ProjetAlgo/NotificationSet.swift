//
//  NotificationSet.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/22/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import Foundation

class NotificationSet : Identifiable, ObservableObject{
    
    @Published var notifTab : [NotificationPost]
    
    init(notifTab : [NotificationPost]){
        self.notifTab = notifTab
    }
    
    func add(notif : NotificationPost){
        notifTab.append(notif)
    }
    
    func updateTab(notifTab : [NotificationPost]){
        self.notifTab = notifTab
    }
    
    func countNotifPasVu() -> Int{
        var nbPasVu = 0
        print(self.notifTab)
        for i in 0..<self.notifTab.count{
            if(self.notifTab[i].estVu != true){
                nbPasVu = nbPasVu + 1
            }
        }
        return nbPasVu
    }
    
    func estPasVuByPost(postId : String) -> Bool{
        
        for i in 0..<self.notifTab.count{
            if(self.notifTab[i].estVu != true && self.notifTab[i].post.id == postId){
                return true
            }
        }
        return false
    }
    
    func setEstVuByPost(postId : String){
        for i in 0..<self.notifTab.count{
            if(self.notifTab[i].estVu != true && self.notifTab[i].post.id == postId){
                self.notifTab[i].estVu = true
                print(self.notifTab[i].post.id)
            }
        }
    }
    
    func getIdNotifByPostId(postId : String) -> String{
        var notifId = ""
        print(self.notifTab.description)
        for i in 0..<self.notifTab.count{
            if(self.notifTab[i].post.id == postId){
                print(self.notifTab[i].dateCreation)
                notifId = self.notifTab[i].id
            }
        }
        return notifId
    }
    
    func getIByPostId(postId : String) -> Int{
        var j = -1
        print(self.notifTab.description)
        for i in 0..<self.notifTab.count{
            if(self.notifTab[i].post.id == postId){
                print(self.notifTab[i].dateCreation)
                j = i
            }
        }
        return j
    }
}
