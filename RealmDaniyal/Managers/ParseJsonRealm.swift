//
//  ParseJsonRealm.swift
//  RealmDaniyal
//
//  Created by Daniyal Yousuf on 9/28/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit
import RealmSwift

class ParseJsonRealm: NSObject {
    let dbManager = DBManager.sharedInstance
    override init() {

        
        if let path = Bundle.main.url(forResource: "JSON", withExtension: "json")
        {
                if let jsonData = try? Data(contentsOf:path, options:.alwaysMapped)  //Data(bytesNoCopy: path, count: .DataReadingMappedIfSafe, deallocator: nil)
                {
                    if let jsonResult: NSDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! NSDictionary  //JSONSerialization.JSONObjectWithData(jsonData, options: .ReadingOptions.MutableContainers) as? NSDictionary
                    {
                        if let persons : NSDictionary = jsonResult["widget"] as? NSDictionary
                        {
                            let widgetModel = WidgetModel(dict: persons)
                            dbManager.addObject(obj: widgetModel)
                            print(widgetModel)
                            
                            let fetchWidgetModel = dbManager.retrivesObjects(Obj: WidgetModel())
                            let widgetArray : [WidgetModel] = dbManager.castArray(array: fetchWidgetModel) as! [WidgetModel]
                            print(widgetArray.count)
                        }
                    }
                }
            }
        }
    
}


class WidgetModel: Object {
    
    @objc dynamic var debug  = ""
    @objc dynamic var window  : WindowModel!
    @objc dynamic var image   : ImageModel!
    @objc dynamic var text    : TextModel!
    convenience init(dict: NSDictionary) {
        self.init()
        self.debug   = dict.value(forKey: "debug") as! String
        self.image   = ImageModel(dict:  dict.checkforObject(keyValue: "image"))
        self.window  = WindowModel(dict: dict.checkforObject(keyValue: "window"))
        self.text    = TextModel(dict:   dict.checkforObject(keyValue: "text"))
    }
    
}
class TextModel: Object {
    
    @objc dynamic var data = ""
    @objc dynamic var size = 0
    @objc dynamic var style = ""
    @objc dynamic var name = ""
    @objc dynamic var hOffset = 0
    @objc dynamic var vOffset = 0
    @objc dynamic var alignment = ""
    @objc dynamic var onMouseUp = ""
    
    convenience init(dict: NSDictionary?) {
        self.init()
        if let isData = dict {
            self.data   =   isData.value(forKey: "data")    as! String
            self.size   =   isData.value(forKey: "size")    as! Int
            self.style  =   isData.value(forKey: "style")   as! String
            self.name   =   isData.value(forKey: "name")    as! String
            self.hOffset    =   isData.value(forKey: "hOffset")     as! Int
            self.vOffset    =   isData.value(forKey: "vOffset")     as! Int
            self.alignment  =   isData.value(forKey: "alignment")   as! String
            self.onMouseUp  =   isData.value(forKey: "onMouseUp")   as! String
        }
    }
    
}

class ImageModel: Object {
    @objc dynamic var src  = ""
    @objc dynamic var name = ""
    @objc dynamic var hOffset = 0
    @objc dynamic var vOffset = 0
    @objc dynamic var alignment = ""
    
    convenience init(dict: NSDictionary?) {
        self.init()
        if let isData = dict {
            self.src       = isData.value(forKey: "src")       as! String
            self.name      = isData.value(forKey: "name")      as! String
            self.hOffset   = isData.value(forKey: "hOffset")   as! Int
            self.vOffset   = isData.value(forKey: "vOffset")   as! Int
            self.alignment = isData.value(forKey: "alignment") as! String
        }
        
    }
}

class WindowModel: Object {
    @objc dynamic var title = ""
    @objc dynamic var name  = ""
    @objc dynamic var width = 0
    @objc dynamic var height = 0
    
    convenience init(dict: NSDictionary?) {
        self.init()
        if let isData = dict {
            self.title  = isData.value(forKey: "title")  as! String
            self.name   = isData.value(forKey: "name")   as! String
            self.width  = isData.value(forKey: "width")  as! Int
            self.height = isData.value(forKey: "height") as! Int
        }
    }
    
}


extension NSDictionary {
    
    func checkforObject(keyValue: String) -> NSDictionary? {
        if let isData = self.value(forKey: keyValue) {
            return isData as? NSDictionary
        }
        return nil
    }
    
}
