//
//  UserFetcher.swift
//  ProjetAlgo
//
//  Created by user165002 on 2/28/20.
//  Copyright © 2020 user165002. All rights reserved.
//


import Foundation
import Combine
 

public class UserFetcher: ObservableObject {
    @Published var user = User()
    let urlJSON = Bundle.main.url(forResource: "user", withExtension: "json")
    
    init(){
        load()
    }
    
    func load() {
        if let url = urlJSON{
            do {
                let d  = try Data(contentsOf: url)
                    let decodedLists = try JSONDecoder().decode(User.self, from: d)
                    
                
            } catch {
                print ("Error")
            }
        }else{
            print ("pas de fichier")
        }
    }
    
    func addPersonJSON(user : User){
        
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(user)
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let subURL = documentDirectory.appendingPathComponent("user.json")
            try JsonData.write(to: subURL)
            
        }catch{}
        
    }
         
    
}
