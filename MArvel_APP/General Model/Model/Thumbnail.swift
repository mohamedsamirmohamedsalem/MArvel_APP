//
//  Thumbnail.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import Foundation
import ObjectMapper

struct Thumbnail: Mappable{
    ///String path
    var path: String
    ///String ext ( extension )
    var ext: String
    /**
     - Parameter map: `Map`
     */
    init?(map: Map){
        path = (try? map.value("path")) ?? ""
        ext = (try? map.value("extension")) ?? ""
    }
    
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        path <- map["path"]
        ext <- map["extension"]
    }
    /**
     - Returns: String url com extention
     */
    func getUrl() -> String{
        return path + "." + ext
    }
}
