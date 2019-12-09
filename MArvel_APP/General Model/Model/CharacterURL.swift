//
//  CharacterURL.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//
import Foundation
import ObjectMapper

struct CharacterURL: Mappable{
    ///String type
    var type: String
    ///String url
    var url: String
    

    init?(map: Map){
        type = (try? map.value("type")) ?? ""
        url = (try? map.value("url")) ?? ""
    }
    
 
    mutating func mapping(map: Map) {
        type <- map["type"]
        url <- map["url"]
    }
}
