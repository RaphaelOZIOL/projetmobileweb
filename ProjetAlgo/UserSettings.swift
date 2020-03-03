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
}

