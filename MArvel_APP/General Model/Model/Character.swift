//
//  Character.swift
///  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import Foundation
import ObjectMapper


struct Character: Mappable{
    var id: Int
    var name: String
    var description: String
    var thumbnail: Thumbnail
    ///Array CharacterURL
    var urls: [CharacterURL]
    
    
    init?(map: Map){
        id = (try? map.value("id")) ?? 0
        name = (try? map.value("name")) ?? ""
        description = (try? map.value("description")) ?? ""
        thumbnail = (try? map.value("thumbnail")) ?? Thumbnail(map: map)!
        urls = [(try? map.value("urls")) ?? CharacterURL(map: map)!]
    }
  
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnail <- map["thumbnail"]
        urls <- map["urls"]
    }
    
}
