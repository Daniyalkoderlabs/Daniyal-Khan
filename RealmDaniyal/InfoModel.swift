//
//  InfoModel.swift
//  RealmDaniyal
//
//  Created by Daniyal Yousuf on 9/27/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit
import RealmSwift
class InfoModel: Object {

    @objc dynamic var userName = ""
    @objc dynamic var userEmail = ""
    
    convenience init(name:String, email:String) {
        self.init()
        self.userName = name
        self.userEmail = email
    }
}
