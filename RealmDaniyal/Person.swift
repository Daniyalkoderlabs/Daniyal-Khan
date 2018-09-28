//
//  Person.swift
//  RealmDaniyal
//
//  Created by Daniyal Yousuf on 9/27/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit
import RealmSwift
class Person: Object {
    @objc dynamic var name = ""
    var dogs = List<Dog>()
    
    func usingJSON() {
        let data = "{\"name\": \"San Francisco\", \"cityId\": 123}".data(using: .utf8)!
        let realm = try! Realm()
        
        // Insert from Data containing JSON
        try! realm.write {
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            realm.create(City.self, value: json, update: true) //create will work only with primary key; incase of no primary key, it would throw error..
        }
        
        
        
        let getdata = realm.objects(City.self)
        print(getdata)

       //GET SPECIFIC OBJECT USING PRIMARY KEY
        guard let specificCity = realm.object(ofType: City.self, forPrimaryKey: 123) else { return }
        print(specificCity)
        
        try! realm.write {
            specificCity.name = "New york City"
        }
        guard let specificCityupdated = realm.object(ofType: City.self, forPrimaryKey: 123) else { return }
        print(specificCityupdated)
        
        
    }
}


class Dog: Object {
    @objc dynamic var name = ""
    let owners = LinkingObjects(fromType: Person.self, property: "dogs")
}

// A Realm
//Object that represents a city
class City: Object {
    @objc dynamic var name = ""
    @objc dynamic var cityId = 0
    //To update any record, primary key is required
    override class func primaryKey() -> String? {
        return "cityId"
    }
    
    convenience init(name:String, cityId: Int) {
        self.init()
        self.name = name
        self.cityId = cityId
    }
    // other properties left out ...
}


