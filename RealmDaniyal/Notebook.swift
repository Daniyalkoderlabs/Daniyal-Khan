//
//  Notebook.swift
//  RealmDaniyal
//
//  Created by Daniyal Yousuf on 9/27/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit
import RealmSwift

class Notebook: Object {
    
    @objc dynamic var name = ""
    var notes = List<Note>()
    
    convenience init(name: String, notes: List<Note>) {
        self.init()
        self.name = name
        self.notes = notes
    }
}

class Note: Object {
    @objc dynamic var pageNo = 0
    @objc dynamic var pageTitle = ""
    
    
    convenience init(pageNo: Int, pageTitle: String) {
        self.init()
        self.pageNo = pageNo
        self.pageTitle = pageTitle
    }
}
