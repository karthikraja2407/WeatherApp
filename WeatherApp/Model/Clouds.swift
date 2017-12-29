//
//  clouds.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation
import SwiftyJSON

struct Clouds {
  let all:Int?
  
  init(json:JSON) {
    self.all = json["all"].int
  }
}
