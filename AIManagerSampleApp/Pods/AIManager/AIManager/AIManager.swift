//
//  AIManager.swift
//  AIManager
//
//  Created by Sanketh Purwar on 5/31/16.
//  Copyright © 2016 Sanketh Purwar. All rights reserved.
//


import Foundation


class AIM {
    
    
    private var started = false
    
    // swiftSharedInstance is not accessible from ObjC
    class var swiftSharedInstance: AIM
    {
        struct Singleton
        {
            static let instance = AIM()
        }
        return Singleton.instance
    }
    
    // the sharedInstance class method can be reached from ObjC
    public static func sharedInstance() -> AIM
    {
        return AIM.swiftSharedInstance
    }
    
    
    @objc public func start()
    {
        self.started = true
        register()
        //showMessage("Started!")
    }
    
    @objc public func stop()
    {
        unregister()
        self.started = false
        //showMessage("Stopped!")
    }
    
    func register(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(startAI), name: "com.alamofire.notifications.task.didResume", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(stopAI), name: "com.alamofire.notifications.task.didSuspend", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(stopAI), name: "com.alamofire.notifications.task.didCancel", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(stopAI), name: "com.alamofire.notifications.task.didComplete", object: nil)
    }
    
    func unregister(){
        
    }
    
    @objc func startAI(){
        ProgressAnimationView.startAnimating()
    }
    @objc func stopAI(){
        ProgressAnimationView.stopAnimating()
    }
}