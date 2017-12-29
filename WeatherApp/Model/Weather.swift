//
//  Weather.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation
import SwiftyJSON

struct Weather {
  let weatherID : Int?
  let main:String?
  let description:String?
  let icon:String?
  
  init?(json:JSON) {
    
    //more than one weather data may exist , as per API document first weather data is primary data , hence retrieving the first object.
    if let json = json.array, json.count > 0 {
      let weather = json[0]
      self.weatherID = weather["id"].int
      self.main = weather["id"].string
      self.description = weather["description"].string
      self.icon = weather["icon"].string
    }else{
      return nil
    }
  }
}

