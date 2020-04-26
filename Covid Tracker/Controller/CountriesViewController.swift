//
//  CountriesViewController.swift
//  Covid Tracker
//
//  Created by Umar Afzal on 4/19/20.
//  Copyright © 2020 Umar Afzal. All rights reserved.
//

import UIKit
import LoadingShimmer
import SwiftyJSON

class CountriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    //MARK:-IBOutlets
    @IBOutlet weak var countriesTable: UITableView!
    
    //MARK:-Properties
    
    var dataLoaded:Bool = false
    var countries:Array<CovidModel> = Array<CovidModel>()
    
    //MARK:-Lifecycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.countriesTable.delegate = self
        self.countriesTable.dataSource = self
        
        LoadingShimmer.startCovering(self.countriesTable, with: [""])
        
        getCountriesData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
     
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK:-Private
    
    
    func getCountriesData()
    {
        CovidAPI.getAllCountriesData { (response, error, reach) in
            
            if let json = response?.arrayValue
            {
                for country in json
                {
                    let c = CovidModel.init(info: country)
                    
                    if c.country != ""
                    {
                        self.countries.append(c)
                    }
                }
                
                
                self.dataLoaded = true
                self.countriesTable.reloadData()
                
                LoadingShimmer.stopCovering(self.countriesTable)
            }
            
            
        }
    }
    
    //MARK:-UITableViewDelegate/Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataLoaded ? self.countries.count: 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:CountryCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        cell.selectionStyle = .none
        
        if dataLoaded
        
        {
            cell.setupCountry(country: countries[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let view:CountryDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CountryDetailsViewController") as! CountryDetailsViewController
        
        view.covidInfo = countries[indexPath.row]
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    //MARK:-IBActions
}
