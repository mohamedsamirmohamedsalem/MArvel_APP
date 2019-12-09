//
//  ApiURL.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import Foundation
import CryptoSwift


 
class ApiURL{
    // base URL
    static let basePath = "https://gateway.marvel.com/v1/public"
    // Characters endpoint
    static let pathCharacters = "/characters?"
    // Characters details endpoint
    static let pathCharactersDetails = "/characters?"
    
    static let limit = 50
    // String privateKey api marvel
    static private let privateKey = "ee013c7cacd98ce57c48ac0cec9f6d27c45a84ad"
    // String publicKey api marvel
    static private let publicKey = "bd5fa9b0cd6e31dbff99cf85430b2060"
    

     // Returns: String query
    static func getCredentials() -> String{
        let ts = Date().timeIntervalSince1970.description
        let hash = "\(ts)\(privateKey)\(publicKey)".md5()
        let authParams = ["ts": ts, "apikey": publicKey, "hash": hash]
        return authParams.queryString!
    }
}
