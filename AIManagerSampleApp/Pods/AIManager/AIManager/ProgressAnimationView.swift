//
//  ProgressAnimationView.swift
//  AIManager
//
//  Created by Sanketh Purwar on 5/31/16.
//  Copyright © 2016 Sanketh Purwar. All rights reserved.
//

import Foundation

import UIKit

// MARK: - Globals -


class ProgressAnimationView: UIView
{
    
    static var instance = ProgressAnimationView()
    // MARK: - Properties -
    
    var backgroundView: UIView
    var activityIndicator: UIActivityIndicatorView
    
    // MARK: - Methods -
    
    required override init(frame: CGRect) {
        
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        super.init(frame: frame)
        
        
        
        let vc =  UIApplication.sharedApplication().windows.first?.rootViewController
        backgroundView.frame = vc!.view.bounds
        activityIndicator.center = backgroundView.center
        vc?.view.addSubview(backgroundView)
        vc?.view.addSubview(activityIndicator)
    }
    
    convenience required init(coder aDecoder: NSCoder) {
        self.init(frame: CGRectZero)
    }
    
    
    // MARK: - Progress Animation
    
    
    
    func startAnimating() {
        activityIndicator.startAnimating()
        backgroundView.hidden = false
    }
    
    func stopAnimating() {
        dispatch_async(dispatch_get_main_queue()){
            self.activityIndicator.stopAnimating()
            self.backgroundView.hidden = true
        }
    }
    
}














