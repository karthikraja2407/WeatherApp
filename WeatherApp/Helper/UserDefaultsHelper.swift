//
//  UserDefaultsHelper.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/29/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation

final class UserDefaultsHelper{
  static let sharedInstance = UserDefaultsHelper()
  private init() {}
  
  /**
   setLastSearchedValue method stores the last searched text in userdefaults
   
   - parameter text: searched text
   */
  
  func setLastSearchedValue(value:String)  {
    let defaults = UserDefaults.standard
    defaults.set(value, forKey: CONSTANT.LAST_SEARCHED_TEXT)
  }
  
  /**
   updateLastSearchedText method stores the last searched text in userdefaults
   
   - returns: stored last searched text in userdefaults
   */
  
  func getLastSearchedValue() -> String?  {
    let defaults = UserDefaults.standard
    return defaults.string(forKey: CONSTANT.LAST_SEARCHED_TEXT)
  }
}
