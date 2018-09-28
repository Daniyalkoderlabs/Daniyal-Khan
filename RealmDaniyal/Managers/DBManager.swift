//
//  DBManager.swift
//  RealmDaniyal
//
//  Created by Daniyal Yousuf on 9/27/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit
import RealmSwift
import Realm
var realm: Realm!


enum Result {
    case success(Object)
    case failure(String)
}
typealias objectReference = (Result) -> Void

class DBManager: NSObject {
    
    static let sharedInstance = DBManager()
    private override init() {
       realm = try! Realm()
        if let isURL = realm.configuration.fileURL {
            print(isURL)
        }
    }
    
    func addObject(obj: Object) {
        try! realm.write {
            realm.add(obj)
        }
    }
    
    func deleteObject(Obj: Object) {
        try! realm.write {
            realm.delete(Obj)
        }
    }
    
    func retriveObject(Obj: Object, key:Int) -> Object? {
        return realm.object(ofType:type(of: Obj), forPrimaryKey: key)
    }
    
    func retrivesObjects(Obj: Object) -> Results<Object>? {
        return realm.objects(type(of: Obj))
    }
    
    func countforObject(Obj: Object) -> Int? {
        if let count = retrivesObjects(Obj: Obj)?.count  {
            return count
        }
        return 0
    }
    
    
    func updateObject(Obj: Object, key:Int, ref:objectReference) {
        
        let specificObject = self.retriveObject(Obj: Obj, key: key)
        
        guard let actualObject = specificObject else {
            
            return ref(.failure(    "NO OBJECT HAS BEEN FOUND"  ))
            
        }
        ref(.success(actualObject))
    }
    
    func update(block: @escaping ()->Void) {
        
        try! realm.write(block)
    }
    
    
    func deleteObject(Obj: Object, key:Int, ref:objectReference) {
        
        let specificObject = self.retriveObject(Obj: Obj, key: key)
        
        guard let actualObject = specificObject else {
            return ref(.failure(    "NO OBJECT HAS BEEN FOUND"  ))
        }
        ref(.success(actualObject))
    }
    
    
    func delete(objects : [Object]) {
        
        try! realmObject.write{
            realmObject.delete(objects)
        }
    }
    
    func performQueryOnObject(Obj: Object, query:String) -> Results<Object>? {
        return self.retrivesObjects(Obj: Obj)?.filter(query)
    }
    
    func castArray(array:Results<Object>?) -> [AnyObject] {
        if let data = array {
            return Array(data)
        }
        return []
    }
    
}
