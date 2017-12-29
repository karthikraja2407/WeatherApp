//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import XCTest
@testable import WeatherApp
import SwiftyJSON

class WeatherAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPISuccess() {
      
       let viewModel = CityWeatherViewModel()
      let expect = expectation(description: "Wait for weather API call")
      viewModel.getCityWeather(name: "London", success: { (icon, description, name, geoCoordinate, temperature) in
        expect.fulfill()
      }) { (error) in
        XCTFail("weather api test failed")
        expect.fulfill()
      }
      wait(for: [expect], timeout: 60)
    }
  
  func testAPIFailure() {
    let viewModel = CityWeatherViewModel()
    let expect = expectation(description: "Wait for weather API call")
    viewModel.getCityWeather(name: "London123", success: { (icon, description, name, geoCoordinate, temperature) in
      XCTFail("weather api should fail")
      expect.fulfill()
    }) { (error) in      
      expect.fulfill()
    }
    wait(for: [expect], timeout: 60)
  }
  
  func testConvertToCelcius() {
    let value = CityWeatherViewModel().convertToCelcius(100)
    XCTAssertNotNil(value, "celcius value is nil")
    if let value = value {
    XCTAssertEqual(value, "-173.1")
    }
  }
    
  func testLastSearchTest() {    
    let searchText = "London"
    let viewModel = CityWeatherViewModel()
    viewModel.updateLastSearchedText(text: searchText)
    XCTAssertEqual(viewModel.getLastSearchedText(), searchText)
  }
  
  func testWeatherIconURL() {
    let iconName = "10d"
    let expectedURL = API.WEATHER_ICON_URL + iconName + ".png"
    XCTAssertEqual(iconName.getIconURL(), expectedURL)
  }
  
  func testWeatherAPIParser() {
    let bundle = Bundle(for: type(of: self))
    let fileURL = bundle.url(forResource: "WeatherResponse", withExtension: "json")
    let data = try! Data(contentsOf: fileURL!, options: .mappedIfSafe)
    let json = JSON(data)
    let weatherDetails = WeatherDetails(json: json)
    //Need to validate for each data .
    XCTAssertEqual(weatherDetails.weather?.description, json["weather"][0]["description"].string)
    XCTAssertEqual(weatherDetails.weather?.icon, json["weather"][0]["icon"].string)
    
  }
    
}
