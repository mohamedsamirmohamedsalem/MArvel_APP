//
//  MarvelData.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//
import Foundation
import ObjectMapper


struct MarvelData: Mappable{
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    ///Array [Character] results
    var results: [Character]
    
  
    init?(map: Map) {
        offset = (try? map.value("offset")) ?? 0
        limit = (try? map.value("offset")) ?? 0
        total = (try? map.value("offset")) ?? 0
        count = (try? map.value("offset")) ?? 0
        results = [(try? map.value("results")) ?? Character(map: map)!]
    }

    mutating func mapping(map: Map) {
        offset <- map["total_count"]
        limit <- map["limit"]
        total <- map["total"]
        count <- map["count"]
        results <- map["results"]
    }
}
