//
//  URLExtension.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/29/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation

extension String{
  /**
   getIconURL method returns the weather icon url
   
   - returns weather icon url as a String
   */
  
  func getIconURL() -> String {
    return API.WEATHER_ICON_URL + self + ".png"
  }
}
