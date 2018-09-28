//
//  RealmTestModels.swift
//  Created by meguid
//

import Foundation
import RealmSwift

class RealmParentUser: Object {
    
    @objc dynamic var first_name = ""
    @objc dynamic var last_name = ""
    @objc dynamic var age = 25
    @objc dynamic var isHappy = true
}

class ChildUser: Object {
    
    var parents = List<RealmParentUser>()
    @objc dynamic var name = ""
    @objc dynamic var toys = 5200
    @objc dynamic var isFine = false
}
