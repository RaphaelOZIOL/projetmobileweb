//
//  UserSet.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/28/20.
//  Copyright © 2020 user165002. All rights reserved.
//

class UserSet : ObservableObject {
    @Published var data : [User]
    var userFetcher : UserFetcher
    
    init(){
        self.userFetcher = UserFetcher()
        self.data = userFetcher.persons
    }
    
    func addUser(u: User){
        data.append(u)
    }
}
