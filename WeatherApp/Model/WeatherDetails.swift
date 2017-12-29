//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation
import SwiftyJSON

struct WeatherDetails {
  let coord:Coordinate?
  let weather : Weather?
  let base :String?
  let main : Main?
  let visibility:Int?
  let wind : Wind?
  let clouds: Clouds?
  let dt : Int?
  let sys: Sys?
  let weatherDetailsID : Int?
  let name : String?
  let cod : Int?
  let message : String?
  
  
  init(json:JSON){
    self.coord =  Coordinate(json:json["coord"])
    self.weather = Weather(json: json["weather"])
    self.base = json["base"].string
    self.main = Main(json: json["main"])
    self.visibility = json["visibility"].int
    self.wind = Wind(json: json["wind"])
    self.clouds = Clouds(json: json["clouds"])
    self.dt = json["dt"].int
    self.sys = Sys(json:json["sys"])
    self.weatherDetailsID = json["id"].int
    self.name = json["name"].string
    self.cod = json["cod"].int
    self.message = json["message"].string
  }
  
}
