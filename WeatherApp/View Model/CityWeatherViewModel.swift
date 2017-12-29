//
//  CityWeatherViewModel.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation
import SwiftyJSON

struct CityWeatherViewModel:CityWeatherProtocol {
  
  // MARK: - functional methods
  
  /**
   getCityWeather method fires a API request and fetches the weather data
   
   - parameter name: city name
   - parameter success: apiSuccess callback
   - parameter failure: apiFailure callback
   */
  
  func getCityWeather(name : String,success:@escaping apiSuccess,failure:@escaping apiFailure) {
    let requestParams = ["q":name,"APPID":API.APP_ID] as [String : AnyObject]    
    NetworkManager.get(API.WEATHER_URL, parameters: requestParams as [String : AnyObject], success: {(result: NSDictionary) -> Void in
      let weatherDetails = self.parseData(result: result)
      
      if let cod = weatherDetails.cod,cod == 200{
        //update last searched text only for success
        self.updateLastSearchedText(text: name)
        let iconURL = weatherDetails.weather?.icon?.getIconURL()
        let description = weatherDetails.weather?.description
        let name = weatherDetails.name
        var coordinates:String?
        //assuming both latitude and longitude will exist together ,else need to change this logic
        if let latitude = weatherDetails.coord?.latitude, let longitude = weatherDetails.coord?.longitude{
          coordinates =  "coordinates : [\(latitude), \(longitude)]"
        }
        var temperature : String?
        let temp = self.convertToCelcius(weatherDetails.main?.temp)
        let minTemp = self.convertToCelcius(weatherDetails.main?.temp_min)
        let maxTemp = self.convertToCelcius(weatherDetails.main?.temp_max)
        //assuming  temp,minTemp and maxTemp will exist together ,else need to change this logic
        if let temp = temp, let minTemp = minTemp , let maxTemp = maxTemp{
          temperature = "Temperature " + temp + "C, from " + minTemp + "C to " + maxTemp + "C"
        }
        success( iconURL  ,description , name, coordinates,temperature )
      }else{
        failure(weatherDetails.message)
      }
    }, failure: {(error: NSDictionary?) -> Void in
      if let error = error?["error"] as? NSError {
        failure(error.description)
      }
      print ("Api Failure : error is:\n \(String(describing: error))")
    })
  }
  
  /**
   updateLastSearchedText method stores the last searched text in userdefaults
   
   - parameter text: searched text
   */
  
  func updateLastSearchedText(text:String?)  {
    guard let text = text else {
      return
    }
    UserDefaultsHelper.sharedInstance.setLastSearchedValue(value: text)
  }
  
  /**
   updateLastSearchedText method stores the last searched text in userdefaults
   
   - returns: stored last searched text in userdefaults
   */
  
  func getLastSearchedText() -> String? {
    return UserDefaultsHelper.sharedInstance.getLastSearchedValue()
  }
  
  // MARK: - parsers
  
  /**
   parseData method parses the API response and returns WeatherDetails
   
   - parameter result: API response data as NSDictionary
   - returns: optional WeatherDetails object
   */
  func parseData(result:NSDictionary) -> WeatherDetails{
    let jsonData = JSON(result)
    let weatherDetails = WeatherDetails(json: jsonData)
    return weatherDetails
  }
  
  // MARK: - Utility methods
  
  //TODO : Below method can be moved to utility class
  
  /**
   convertToCelcius method converts kelvin to celcius
   
   - parameter kelvinTemp: Temperature in kelvin
   - returns: temperature in celcius
   */
  
  func convertToCelcius(_ kelvinTemp:Double?) -> String? {
    guard let kelvinTemp = kelvinTemp else {
      return nil
    }
    let celsiusTemp = kelvinTemp - 273.15
    return String(format: "%.1f", celsiusTemp)
  }
  
}




