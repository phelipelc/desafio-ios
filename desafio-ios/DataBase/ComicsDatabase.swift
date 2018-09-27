//
//  ComicsDatabase.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 26/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit
import RealmSwift
class ComicsDatabase: Object {
    static let sharedInstance : ComicsDatabase = {
        return ComicsDatabase()
    }()
    
    @objc dynamic var id: Int = 0
    @objc dynamic var image: String = ""
    @objc dynamic var descript: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var price: Double = 0.0
    @objc dynamic var date: String = ""
    @objc dynamic var isfavorite = true
   
    func createComics(comics: ComicsDatabase){
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(comics)
        }
    }
    func updateUser(idComic: Int, favorite: Bool) {
        let realm = try! Realm()
        if realm.objects(ComicsDatabase.self).count > 0 {
            let userRetrieved = realm.object(ofType: ComicsDatabase.self, forPrimaryKey: idComic)
            realm.objects(ComicsDatabase.self).filter("id == \(idComic)")
            try! realm.write {
                userRetrieved!.isfavorite = favorite
            }
        }
    }
    func deleteComics() {
        let realm = try! Realm()
        if let usr = realm.objects(ComicsDatabase.self).first {
            try! realm.write {
                realm.delete(usr)
            }
        }
    }
    func getUser(id: Int) -> Int? {
        let realm = try! Realm()
        if realm.objects(ComicsDatabase.self).count > 0 {
        let result = realm.objects(ComicsDatabase.self).filter("id == \(id) AND isfavorite == true")
         return result.count
            
    }
        return nil

}
}
