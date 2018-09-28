//
//  ViewController.swift
//  RealmDaniyal
//
//  Created by Daniyal Yousuf on 9/26/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realM = try! Realm()
        /*let authenticationModel = AuthenticationModel()
        authenticationModel.userPass     = "321Za#"
        authenticationModel.userEmail    = "d_y123@gmail.com"
        authenticationModel.id           = 10
        
        try! realM.write {
            realM.add(authenticationModel)
        }
        
        let getauthenticationModel = realM.objects(AuthenticationModel.self).first
        _ =  AuthenticationModel.primaryKey()
        print(getauthenticationModel)
        
        
        //How to deal with realm List
        let names = List<String>()
        names.append("daniyal")
        names.append("nabeel")
        names.append("bilal")
        names.append("nehal")
        
        //Once can make multiple constructor
        try! realM.write {
            realM.add(AuthenticationModel(nameList: names))
        }
        
        
        //get data from database
        _ = realM.objects(AuthenticationModel.self)
        print(realM.objects(AuthenticationModel.self))
        
        //Filter
        let model2 = realM.objects(AuthenticationModel.self).filter("id == 10").first //return array and then get first element
        print(model2)
        
        
        // RealationShips
        
        //one to many as shown by LIST<Note>
        //one to one as shown  by single Note
        let note1 = Note(pageNo: 1, pageTitle: "A")
        let note2 = Note(pageNo: 2, pageTitle: "B")
        let note3 = Note(pageNo: 3, pageTitle: "C")
        let note4 = Note(pageNo: 4, pageTitle: "D")
        let note5 = Note(pageNo: 5, pageTitle: "E")
        
        let notesList = List<Note>()
        notesList.append(note1)
        notesList.append(note2)
        notesList.append(note3)
        notesList.append(note4)
        notesList.append(note5)
        
        
        let notebook = Notebook(name: "Oceans", notes: notesList)
        
        try! realM.write {
            realM.add(notebook)
        }
        
        let notebooks = realM.objects(Notebook.self)
        print(notebooks)
        
        let jsonObject = Person()
        jsonObject.usingJSON()
        
        //DBMANAGER REALM MANANGER
        
        let dbManager = DBManager.sharedInstance
        let note11     = Note(pageNo: 1 , pageTitle: "A")
        let note22     = Note(pageNo: 2 , pageTitle: "B")
        let noteList = List<Note>()
        noteList.append(note11)
        noteList.append(note22)
        
        
        
        let notebookk = Notebook(name: "Oceans", notes: noteList)
        dbManager.addObject(obj: notebookk)
        
        let city = City(name: "Los-Angeles", cityId: 007)
        dbManager.addObject(obj: city)
        
        
        let specificCity = dbManager.retriveObject(Obj: City(), key: 007)
        print(specificCity)  // Must be LosAngeles
        
        
        let notesArray = dbManager.retrivesObjects(Obj: Notebook())
        print(notesArray)
        
        
        let citytoEdit = dbManager.updateObject(Obj: City(), key: 007) { (result) in
            
            switch result {
                
            case .success(let actualObject):
                updateData(obj: actualObject)
                
            case .failure(let err):
                print(err)
                
            }
            
        }
        
        func updateData(obj:Object) {
            if let specificCity = obj as? City {
                
                dbManager.update {
                    specificCity.name = "Lasvegas"
                }
            }
        }
        
        let citytoDelete = dbManager.deleteObject(Obj: City(), key: 007) { (result) in
            
            switch result {
                
            case .success(let actualObject):
                deleteObject(Obj: actualObject)
            case .failure(let err):
                print(err)
                
            }
            
        }
        
        
        func deleteObject(Obj:Object) {
            if let specificCity = Obj as? City {
                
                dbManager.deleteObject(Obj: specificCity)
                
            }
        }
        
        
        
    */
    }
 
    
}
