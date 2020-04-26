//
//  CovidAPI.swift
//  Covid Tracker
//
//  Created by Umar Afzal on 4/18/20.
//  Copyright © 2020 Umar Afzal. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

struct QBCredentialsConstant {
    static let applicationID:UInt = 80565
    static let authKey = "buqs6WSsDfmPVSc"
    static let authSecret = "tsu3WWYwAju3hXW"
    static let accountKey = "Ahfa5FZiXsWDo3bRQTif"
}

class CovidAPI
{

    
    class func getAllCountriesData(completion: @escaping (_ response:JSON?,_ isReachable:Bool,_ hasError:Bool) -> Void)
    {
        
         let reachability = Reachability()!
        
        if !reachability.isReachable {
            completion(nil,false,true)
            return
        }
        
        let request = AF.request("https://coronavirus-19-api.herokuapp.com/countries",method: .get)
        
        request.responseJSON { (response) in
            
            if response.error != nil
            {
                completion(nil,true,true)
                return
            }
            completion(JSON(response.data as Any),false,false)
            
        }


    }
    
    class func getCountryData(country:String,completion: @escaping (_ response:JSON?,_ isReachable:Bool,_ hasError:Bool) -> Void)
    {
        
         let reachability = Reachability()!
        
        if !reachability.isReachable {
            completion(nil,false,true)
            return
        }
        
        let request = AF.request("https://coronavirus-19-api.herokuapp.com/countries/\(country)",method: .get)
        
        request.responseJSON { (response) in
            
            if response.error != nil
            {
                completion(nil,true,true)
                return
            }
            completion(JSON(response.data as Any),false,false)
            
        }


    }

    
    class func getAllCasesData(completion: @escaping (_ response:JSON?,_ isReachable:Bool,_ hasError:Bool) -> Void)
    {
        
         let reachability = Reachability()!
        
        if !reachability.isReachable {
            completion(nil,false,true)
            return
        }
        
        let request = AF.request("https://coronavirus-19-api.herokuapp.com/all",method: .get)
        
        request.responseJSON { (response) in
            
            if response.error != nil
            {
                completion(nil,true,true)
                return
            }
            completion(JSON(response.data as Any),false,false)
            
        }


    }
}






