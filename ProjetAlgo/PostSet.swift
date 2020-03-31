//
//  PostSet.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/14/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import Foundation
import SwiftUI

class PostSet : ObservableObject{
    
    @Published var postTab : [Post]
    
    init(postTab : [Post]){
        self.postTab = postTab
    }
    
    func add(post : Post){
        postTab.append(post)
    }
    
    func updateTab(postTab : [Post]){
        self.postTab = postTab
    }
    
    func updatePost(post : Post){
        for j in 0..<self.postTab.count{
            if(postTab[j].id == post.id){
                postTab[j] = post
                
            }
        }
    }
    
    func getAllPostNotified(notifTab : NotificationSet) -> PostSet{
        var postList = PostSet(postTab: [])
        for i in 0..<notifTab.notifTab.count{
            for j in 0..<self.postTab.count{
                if(notifTab.notifTab[i].post.id == self.postTab[j].id && notifTab.notifTab[i].estVu == false){
                    postList.add(post: self.postTab[j])
                    
                }
            }
        }
        return postList
    }
    
    func filterByCateg(categ : String){
         var postList = PostSet(postTab: [])
         for j in 0..<self.postTab.count{
            if(self.postTab[j].categ == categ){
                 postList.add(post: self.postTab[j])
                 
             }
         }
        self.postTab = postList.postTab
     }
    
    func filterByLike(){
        self.postTab.sort {$0.likeTab.count >= $1.likeTab.count}
    }
    
    func filterByNbReponse(){
        self.postTab.sort {$0.reponses.count >= $1.reponses.count}
    }
}
