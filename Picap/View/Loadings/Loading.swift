//
//  Loading.swift
//  Picap
//
//  Created by Medios Digitales on 3/30/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class Loading: UIView {
    
    static var get = Loading()
    
    let animView = LOTAnimationView()
    
    static func createView() {
        get.frame = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height:  UIScreen.main.bounds.height)
        
        //view.addSubview(animView)
        //animView.frame = view.frame
        
        let blur = UIVisualEffectView()
        blur.effect = UIBlurEffect(style: .extraLight)
        blur.alpha = 0.2
        
        blur.frame = get.frame
        
        get.addSubview(blur)
        get.addSubview(get.animView)
        
        get.animView.topAnchor.constraint(equalTo: get.topAnchor, constant: 100).isActive = true
        get.animView.bottomAnchor.constraint(equalTo: get.bottomAnchor, constant: 0).isActive = true
        get.animView.leadingAnchor.constraint(equalTo: get.leadingAnchor, constant: 0).isActive = true
        get.animView.trailingAnchor.constraint(equalTo: get.trailingAnchor, constant: 0).isActive = true
        
        get.animView.setAnimation(named: "bike-loader")
        get.animView.frame = Loading.get.frame
        
        get.animView.loopAnimation = true
        get.animView.contentMode = .scaleAspectFit

        get.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
    
    static func Show(){
        
        let vWindow = UIApplication.shared.keyWindow

        createView()
        get.animView.play()
        vWindow?.addSubview(get)
        
        UIView.animate(withDuration: 0.5, animations: {
            get.alpha = 1
        }) { (_) in }
    }
    
    
    static func hide(){
        UIView.animate(withDuration: 2, animations: {
            get.alpha = 0
        }) { (complete) in
            get.removeFromSuperview()
        }
    }
}
