//
//  Main.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation
import SwiftyJSON

struct Main {
  let temp : Double?
  let pressure : Double?
  let humidity : Double?
  let temp_min: Double?
  let temp_max: Double?
  
  init(json:JSON) {
    
    self.temp = json["temp"].double
    self.pressure = json["pressure"].double
    self.humidity = json["humidity"].double
    self.temp_min = json["temp_min"].double
    self.temp_max = json["temp_max"].double
  }    
}
