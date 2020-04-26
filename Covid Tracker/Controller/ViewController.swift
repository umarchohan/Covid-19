//
//  ViewController.swift
//  Covid Tracker
//
//  Created by Umar Afzal on 4/18/20.
//  Copyright © 2020 Umar Afzal. All rights reserved.
//

import UIKit
import Lottie
import LoadingShimmer

class ViewController: UIViewController
{

    //MARK:-IBOutlets
    
    @IBOutlet weak var lblTotalCases: UILabel!
    @IBOutlet weak var lblDeaths: UILabel!
    @IBOutlet weak var lblRecovered: UILabel!
    
    
    @IBOutlet weak var worldAnimationView: UIView!
    
    //MARK:-Properties
    
    var animationView:AnimationView = AnimationView(animation: Animation.named("covid-19"))
    
    //MARK:-Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.8
        animationView.frame = CGRect(x: 0, y: 0, width: worldAnimationView.frame.size.width, height: worldAnimationView.frame.size.height)
        worldAnimationView.addSubview(animationView)
        
        animationView.play(fromProgress: 0, toProgress: 0.71, loopMode: .loop, completion: nil)

        
        CovidAPI.getAllCasesData { (response, reach, error) in
            
            if let json = response
            {
                let cases:Int = json["cases"].intValue
                let deaths:Int = json["deaths"].intValue
                let recovered:Int = json["recovered"].intValue
                
                self.lblTotalCases.text = cases.formattedWithSeparator
                self.lblDeaths.text = deaths.formattedWithSeparator
                self.lblRecovered.text = recovered.formattedWithSeparator
                
                LoadingShimmer.stopCovering(self.view)
                
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        animationView.play(fromProgress: 0, toProgress: 0.71, loopMode: .loop, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
        if self.lblDeaths.text == ""
        {
            LoadingShimmer.startCovering(self.view, with: ["Loading"])
        }
        
        
    }
    //MARK:-Private
    
    //MARK:-IBActions
    
    @IBAction func seeCountries(_ sender: Any)
    {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "CountriesViewController") as! CountriesViewController
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    @IBAction func preventAction(_ sender: Any)
    {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "PreventViewController") as! PreventViewController
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    
}
