//
//  AuthenticationModel.swift
//  RealmDaniyal
//
//  Created by Daniyal Yousuf on 9/26/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit
import RealmSwift

class AuthenticationModel: Object {
    @objc dynamic var userEmail = ""
    @objc dynamic var userPass  = " "
    @objc dynamic var id        = 0
    var names = List <String>()
    var phoneNumber = RealmOptional<Int>()
    
    override static func primaryKey() -> String? {
        return "userPass"
    }
    
    var name: String { // read-only properties are automatically ignored
        return "\(userEmail) \(userPass)"
    }
    
    convenience init(email: String, pass: String, age: Int) {
        self.init()
        self.userEmail = email
        self.userPass  = pass
        self.id        = age
    }
    
    convenience init(nameList: List<String>) {
        self.init()
        self.names = nameList
    }
    
    convenience init(email:String, pass:String, phone:RealmOptional<Int>) {
        self.init()
        self.userEmail = email
        self.userPass  = pass
        self.phoneNumber = phone
    }
}
