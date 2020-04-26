//
//  CountryDetailsViewController.swift
//  Covid Tracker
//
//  Created by Umar Afzal on 4/21/20.
//  Copyright © 2020 Umar Afzal. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController
{

    //MARK:-IBOutlets
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblTotalCases: UILabel!
    @IBOutlet weak var lblDeaths: UILabel!
    @IBOutlet weak var lblTotalTests: UILabel!
    @IBOutlet weak var lblTodayDeaths: UILabel!
    @IBOutlet weak var lblTodayCases: UILabel!
    @IBOutlet weak var lblActive: UILabel!
    @IBOutlet weak var lblRecovered: UILabel!
    @IBOutlet weak var lblCritical: UILabel!
    @IBOutlet weak var llblCasesPerMillion: UILabel!
    @IBOutlet weak var lblTestPerMillion: UILabel!
    @IBOutlet weak var lblDeathPerMillion: UILabel!
    
    //MARK:-Properties
    
    var covidInfo:CovidModel!
    
    //MARK:-Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.lblTodayDeaths.text = "Deaths Today: " + covidInfo.todayDeaths.formattedWithSeparator
        self.lblTotalCases.text = "Total Cases: " + covidInfo.cases.formattedWithSeparator
        self.lblTotalTests.text = "Total Tests: " + covidInfo.totalTests.formattedWithSeparator
        self.lblDeaths.text = "Total Deaths: " + covidInfo.deaths.formattedWithSeparator
        self.lblCountry.text = covidInfo.country
        self.lblTodayCases.text = "Total Cases Today: " + covidInfo.todayCases.formattedWithSeparator
        self.llblCasesPerMillion.text =  "Cases per Million: " + covidInfo.casesPerMillion.formattedWithSeparator
        self.lblTestPerMillion.text =  "Tests per Million: " + covidInfo.testPerMillion.formattedWithSeparator
        self.lblActive.text = "Total Active Cases: " + covidInfo.activeCases.formattedWithSeparator
        self.lblRecovered.text = "Total Recovered Cases: " + covidInfo.recovered.formattedWithSeparator
        self.lblCritical.text = "Total Critical Cases: " + covidInfo.critical.formattedWithSeparator
        self.lblDeathPerMillion.text = "Death per Million: " + covidInfo.deathPerMillion.formattedWithSeparator
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
     
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK:-Private
    
    //MARK:-IBActions

}
