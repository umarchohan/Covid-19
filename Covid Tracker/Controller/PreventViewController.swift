//
//  PreventViewController.swift
//  Covid Tracker
//
//  Created by Umar Afzal on 4/21/20.
//  Copyright © 2020 Umar Afzal. All rights reserved.
//

import UIKit
import Lottie

class PreventViewController: UIViewController
{
    //MARK:-IBOutlets
    
    @IBOutlet weak var preventAnimationView: UIView!
    
    
    //MARK:-Properties
    
    var preventAnimation:AnimationView = AnimationView(animation: Animation.named("prevention"))
    
    //MARK:-Lifecycle
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        addPreventAnimation()
    }
    
    
    //MARK:-Private
    
    func addPreventAnimation()
    {
        preventAnimation.loopMode = .loop
        preventAnimation.contentMode = .scaleAspectFit
        preventAnimation.animationSpeed = 0.8
        preventAnimation.frame = CGRect(x: 0, y: 0, width: preventAnimationView.frame.size.width, height: preventAnimationView.frame.size.height)
        preventAnimationView.addSubview(preventAnimation)
        
        preventAnimation.play(fromProgress: 0, toProgress: 0.71, loopMode: .loop, completion: nil)
    }
    
    //MARK:-IBActions
}
