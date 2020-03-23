//
//  UserSettings.swift
//  ProjetAlgo
//
//  Created by user165002 on 3/3/20.
//  Copyright © 2020 user165002. All rights reserved.
//

import Foundation

class userSettings: ObservableObject {
    @Published var token = ""
    @Published var nom = ""
    @Published var prenom = ""
    @Published var id = ""
   // @Published var notifTab = NotificationSet(notifTab: [])
    
    func loadJson(fileName: String) {
            do {
                if let url:URL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(fileName+".json")/*= Bundle.main.url(forResource: fileName, withExtension: "json") */{
                
                let data = try Data(contentsOf: url)
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                self.token = json!["token"] as! String
                self.nom = json!["nom"] as! String
                self.prenom = json!["prenom"] as! String
                self.id = json!["id"] as! String
                }
            } catch {
                print("error:\(error)")
            }
    }
    
    func writeJson() {
        let settings: [String: Any] = ["token": self.token, "nom": self.nom, "prenom": self.prenom, "id": self.id]
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("UserSettings.json")

            try JSONSerialization.data(withJSONObject: settings)
                .write(to: fileURL)
        } catch {
            print(error)
        }
    }
    
}


