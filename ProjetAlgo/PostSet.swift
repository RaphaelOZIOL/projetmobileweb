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
}
