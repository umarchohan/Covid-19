//
//  CovidModel.swift
//  Covid Tracker
//
//  Created by Umar Afzal on 4/19/20.
//  Copyright © 2020 Umar Afzal. All rights reserved.
//

import UIKit
import SwiftyJSON

struct CovidModel
{
    var todayDeaths:Int = 0
    var cases:Int = 0
    var totalTests:Int = 0
    var deaths:Int = 0
    var country:String = ""
    var todayCases:Int = 0
    var casesPerMillion:Int = 0
    var testPerMillion:Int = 0
    var activeCases:Int = 0
    var recovered:Int = 0
    var critical:Int = 0
    var deathPerMillion:Int = 0
    
    init(info:JSON)
    {
        todayDeaths = info["todayDeaths"].intValue
        cases = info["cases"].intValue
        totalTests = info["totalTests"].intValue
        deaths = info["deaths"].intValue
        country = info["country"].stringValue
        todayCases = info["todayCases"].intValue
        casesPerMillion = info["casesPerOneMillion"].intValue
        testPerMillion = info["testsPerOneMillion"].intValue
        activeCases = info["active"].intValue
        recovered = info["recovered"].intValue
        critical = info["critical"].intValue
        deathPerMillion = info["deathsPerOneMillion"].intValue

    }

}



extension Formatter {
    static let withSeparator: NumberFormatter =
    {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Int
{
    var formattedWithSeparator: String
    {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

