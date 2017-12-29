//
//  CityWeatherProtocol.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation

protocol CityWeatherProtocol {
  
  typealias apiSuccess = (_ icon: String?,_ description:String?,_ name:String?,_ geoCoordinate:String?,_ temperature:String?) -> Void
  typealias apiFailure = (_ error: String?) -> Void
  
  /**
   getCityWeather method fires a API request and fetches the weather data
   
   - parameter name: city name
   - parameter success: apiSuccess callback
   - parameter failure: apiFailure callback
   */
  
  func getCityWeather(name : String,success:@escaping apiSuccess,failure:@escaping apiFailure)
  
  /**
   updateLastSearchedText method stores the last searched text in userdefaults
   
   - parameter text: searched text
   */
  
  func updateLastSearchedText(text:String?)
  
  /**
   updateLastSearchedText method stores the last searched text in userdefaults
   
   - returns: stored last searched text in userdefaults
   */
  
  func getLastSearchedText() -> String?
  
  
  /**
   parseData method parses the API response and returns WeatherDetails
   
   - parameter result: API response data as NSDictionary
   - returns: optional WeatherDetails object
   */
  func parseData(result:NSDictionary) -> WeatherDetails
  
  //TODO : Below method can be moved to utility class
  
  /**
   convertToCelcius method converts kelvin to celcius
   
   - parameter kelvinTemp: Temperature in kelvin
   - returns: temperature in celcius
   */
  
  func convertToCelcius(_ kelvinTemp:Double?) -> String? 
  
}
