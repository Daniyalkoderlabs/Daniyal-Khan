//
//  NetworkManager.swift
//  ExploreRealm
//
//  Created by Daniyal Yousuf on 1/24/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit
class NetworkManager: NSObject {
    var reachibility:Reachability!
    static let sharedInstance = NetworkManager()
    private override init() {
        super.init()
        reachibility = Reachability()
        NotificationCenter.default.addObserver(self, selector: #selector(networkchanged(_:)), name: .reachabilityChanged, object: reachibility)
        do {
            try reachibility.startNotifier()
        } catch  {
            print("Unable to start notifier")
        }
    }
    
    @objc func networkchanged(_ notification:Notification){
        NotificationCenter.default.post(Notification.init(name: Notification.Name.init("NC")))
    }
    func startNotifier(){
        NotificationCenter.default.addObserver(self, selector: #selector(networkchanged(_:)), name: .reachabilityChanged, object: reachibility)
        do {
            try reachibility.startNotifier()
        } catch  {
            print("Unable to start notifier")
        }
    }
    
    func stopMonitoringReach(){
        reachibility.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged,
                                                  object: reachibility)
    }
    static func stopNotifier() -> Void {
        do {
            // Stop the network status notifier
            try (NetworkManager.sharedInstance.reachibility).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
    // Network is reachable
    static func isReachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachibility).connection != .none {
            completed(NetworkManager.sharedInstance)
        }
    }
    
    // Network is unreachable
    static func isUnreachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachibility).connection == .none {
            completed(NetworkManager.sharedInstance)
        }
    }
    
    // Network is reachable via WWAN/Cellular
    static func isReachableViaWWAN(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachibility).connection == .cellular {
            completed(NetworkManager.sharedInstance)
        }
    }
    
    // Network is reachable via WiFi
    static func isReachableViaWiFi(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachibility).connection == .wifi {
            completed(NetworkManager.sharedInstance)
        }
    }
  
}
