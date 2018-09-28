//
//  InfoListingViewController.swift
//  RealmDaniyal
//
//  Created by Daniyal Yousuf on 9/27/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit

class InfoListingViewController: UIViewController {
    var baseTableView:UITableView? = nil
    var lblStatus: UILabel? = nil
    var nameField:UITextField? = nil
    var emailField:UITextField? = nil
    let dbManager = DBManager.sharedInstance
    var infoListArray : [InfoModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initiateProperties()
        
        //Data from DB But in Realm Data Nature
        let datafromDB =  dbManager.retrivesObjects(Obj: InfoModel())
        
        //Casting API from DB Object Nature to Object Oriented Nature
        infoListArray =  dbManager.castArray(array: datafromDB) as! [InfoModel]
        
        //Check Reachibility
        NotificationCenter.default.addObserver(self, selector: #selector(networkDidChanged), name: Notification.Name.init("NC"), object: nil)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTappedAdd(_ sender: UIButton) {
        
        guard let name = nameField?.text, let email = emailField?.text else { return }
        
        let userModel = InfoModel(name: name, email: email)
        
        //add object to database
        dbManager.addObject(obj: userModel)
        
        //add object to array
        infoListArray.append(userModel)
        
        //reload tableView
        baseTableView?.reloadData()
        
        //Reset Text Properties
        
        self.resetProperties()
    }
    
    func resetProperties() {
        self.view.endEditing(true)
        nameField?.text?.removeAll()
        emailField?.text?.removeAll()
    }
    
    func initiateProperties() {
        lblStatus        = (self.view.viewWithTag(98) as! UILabel)
        nameField        = (self.view.viewWithTag(1)  as! UITextField)
        emailField       = (self.view.viewWithTag(2)  as! UITextField)
        baseTableView    = (self.view.viewWithTag(99) as! UITableView)
    }
}

extension InfoListingViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text       = infoListArray[indexPath.row].userName
        cell?.detailTextLabel?.text = infoListArray[indexPath.row].userEmail
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {  //perform querty in dbmanager
        _ =  dbManager.performQueryOnObject(Obj: InfoModel(), query: "userName BEGINSWITH 'D'")
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //delete object from database
            dbManager.deleteObject(Obj: infoListArray[indexPath.row])
            
            //delete object from datasource
            infoListArray.remove(at: indexPath.row)
            
            //tableView reloadData
            baseTableView?.deleteRows(at: [indexPath], with: .none)
            
        }
    }
    
    @objc func networkDidChanged() {
        self.updateView()
        let alertView  = UIAlertController(title: "Network Changed", message: nil, preferredStyle: .actionSheet)
        let buttonOkay = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertView.addAction(buttonOkay)
       // self.present(alertView, animated:true, completion: nil)
    }
    
    func updateView() {
        NetworkManager.isReachable(completed: { (networkManager) in
            self.lblStatus?.text = "Status : 🤢"
            //self.baseTableView?.backgroundColor = UIColor.green
        })
        
        NetworkManager.isUnreachable { (networkManager) in
            self.lblStatus?.text = "Status : 😡"
         //   self.baseTableView?.backgroundColor = UIColor.red
        }
    }
    
}
