//
//  Coordinate.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation
import SwiftyJSON

struct Coordinate {
  let longitude : Double?
  let latitude : Double?
  
  init(json:JSON) {
    self.latitude = json["lat"].double
    self.longitude = json["lon"].double    
  }
}
