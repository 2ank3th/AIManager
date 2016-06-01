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

private var DefaultAnimationView = ProgressAnimationView(frame: CGRectZero)

class ProgressAnimationView: UIView
{
    // MARK: - Properties -
    
    var backgroundView: UIView
    var activityIndicator: UIActivityIndicatorView
    
    class var defaultAnimationView: ProgressAnimationView {
        get {
            return DefaultAnimationView
        }
    }
    
    // MARK: - Methods -
    
    required override init(frame: CGRect) {
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        activityIndicator = UIActivityIndicatorView()
        
        super.init(frame: frame)
        
        addSubview(backgroundView)
        addSubview(activityIndicator)
    }
    
    convenience required init(coder aDecoder: NSCoder) {
        self.init(frame: CGRectZero)
    }
    
    // MARK: - Layout
    
    func layout() {
        backgroundView.frame = bounds
        activityIndicator.center = backgroundView.center
    }
    
    // MARK: - Progress Animation
    
    func startAnimating() {
        let view: UIView = UIApplication.sharedApplication().delegate!.window!!
        startAnimating(inView: view)
    }
    
    func startAnimating(inView view: UIView) {
        startAnimating(inView: view, frame: view.bounds)
    }
    
    func startAnimating(inView view: UIView, frame: CGRect) {
        self.frame = frame
        view.addSubview(self)
        layout()
        
        activityIndicator.startAnimating()
        
        UIView.animateWithDuration(0.4) {
            self.alpha = 1
        }
    }
    
    func stopAnimating() {
        
        self.alpha = 0
        
        self.activityIndicator.stopAnimating()
        self.removeFromSuperview()
        
        //        UIView.animateWithDuration(0.4, animations: {
        //            }) { (finished) in
        //
        //        }
    }
    
    
    
    // MARK: - Class Versions
    
    class func startAnimating() {
        DefaultAnimationView.startAnimating()
    }
    
    class func startAnimating(inView view: UIView) {
        DefaultAnimationView.startAnimating(inView: view)
    }
    
    class func startAnimating(inView view: UIView, frame: CGRect) {
        DefaultAnimationView.startAnimating(inView: view, frame: frame)
    }
    
    class func stopAnimating() {
        DefaultAnimationView.stopAnimating()
    }
}














