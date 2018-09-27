//
//  Movies.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 23/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit
import ObjectMapper

class Datas<T: Mappable>: Mappable{
    var data: T?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}
class Results: Mappable{
    var result: [Comics]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        result <- map["results"]
    }
}
class Comics: Mappable {
    var title: String?
    var year: String?
    var type: String?
    var data: [String: AnyObject]?
    var description: String = ""
    var dates: [Dates]?
    var thumbnail: Thumbnail?
    var prices: [Prices]?
    var characters: Characters?
    var creators: Creators?
    var id: Int?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data    <- map["data"]
        title    <- map["title"]
        year     <- map["age"]
        type     <- map["weight"]
        description <- map["description"]
        dates <- map["dates"]
        thumbnail <- map["thumbnail"]
        prices <- map["prices"]
        characters <- map["characters"]
        creators <- map["creators"]
        id <- map["id"]
    }
    

}
class Dates: Mappable{
    var type: String?
    var date: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
         type    <- map["type"]
         date    <- map["date"]
    }
    
    
}
class Prices: Mappable{
    var type: String?
    var price: Double = 0
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        type    <- map["type"]
        price    <- map["price"]
    }
    
    
}

class Thumbnail: Mappable{
    var path: String?
    var ext: String?
    var image: UIImage?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        path    <- map["path"]
        ext    <- map["extension"]
    }
    
    
}
class Characters: Mappable{
    var items: [Items]?
    var available: Int?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        items    <- map["items"]
         available    <- map["available"]
    }
    
    
}
class Creators: Mappable{
    var items: [Items]?
    var available: Int?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        items    <- map["items"]
        available    <- map["available"]
    }
    
    
}
class Items: Mappable{
    var name: String=""
    var role: String=""
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name    <- map["name"]
        role    <- map["role"]
       
    }
    
    
}

