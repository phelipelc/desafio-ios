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
   
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func createComics(comics: ComicsDatabase){
        let realm = try! Realm()
        
        try! realm.write {
            realm.create(ComicsDatabase.self, value: comics, update: false
            )
        }
    }
    func updateComics(idComic: Int, favorite: Bool) {
        let realm = try! Realm()
        if realm.objects(ComicsDatabase.self).count > 0 {
            let userRetrieved = realm.object(ofType: ComicsDatabase.self, forPrimaryKey: idComic)
            realm.objects(ComicsDatabase.self).filter("id == \(idComic)")
            try! realm.write {
                userRetrieved!.isfavorite = favorite
            }
        }
    }
    
    func getAll() -> [ComicsDatabase]{
        let realm = try! Realm()
        var result = [ComicsDatabase]()
        if realm.objects(ComicsDatabase.self).count > 0 {
            let results = realm.objects(ComicsDatabase.self).filter("isfavorite = true").sorted(byKeyPath: "title", ascending: true)
            for i in 0...results.count-1{
                var comic = ComicsDatabase()
                comic.date =  results[i].date
                comic.descript = results[i].descript
                comic.id = results[i].id
                comic.image = results[i].image
                comic.isfavorite = results[i].isfavorite
                comic.price = results[i].price
                comic.title = results[i].title
                result.append(comic)
            }
        }
        return result
    }
    func deleteComics() {
        let realm = try! Realm()
        if let usr = realm.objects(ComicsDatabase.self).first {
            try! realm.write {
                realm.delete(usr)
            }
        }
    }
    func getComics(id: Int) -> Bool? {
        let realm = try! Realm()
        if realm.objects(ComicsDatabase.self).count > 0 {
            return realm.object(ofType: ComicsDatabase.self, forPrimaryKey: id)?.isfavorite
            
    }
        return nil

}
}
