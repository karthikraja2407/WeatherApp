//
//  SysModel.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation
import SwiftyJSON

struct Sys {
  let type : Int?
  let sysId : Int?
  let message : Double?
  let country : String?
  let sunrise : Double?
  let sunset  : Double?
  
  init(json:JSON){
    self.type = json["type"].int
    self.sysId = json["id"].int
    self.message = json["message"].double
    self.country = json["country"].string
    self.sunrise = json["sunrise"].double
    self.sunset = json["sunset"].double
  }
  
}
