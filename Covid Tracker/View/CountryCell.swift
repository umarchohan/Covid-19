//
//  CountryCell.swift
//  Covid Tracker
//
//  Created by Umar Afzal on 4/19/20.
//  Copyright © 2020 Umar Afzal. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell
{

    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblActive: UILabel!
    @IBOutlet weak var lblRecovered: UILabel!
    @IBOutlet weak var lblDeaths: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCountry(country:CovidModel)
    {
        self.lblCountry.text = country.country + " | Total Cases: \(country.cases.formattedWithSeparator)"
        self.lblActive.text = "Active: " + String(country.activeCases.formattedWithSeparator)
        self.lblDeaths.text = "Deaths: " + String(country.deaths.formattedWithSeparator)
        self.lblRecovered.text = "Recovered: " + String(country.recovered.formattedWithSeparator)
    }

}
