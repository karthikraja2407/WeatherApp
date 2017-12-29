//
//  ViewController.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import UIKit
import Kingfisher

class CityWeatherViewController: UIViewController ,UISearchBarDelegate{
  var viewModel = CityWeatherViewModel()
  
  
  @IBOutlet weak var iconImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var temparatureLabel: UILabel!
  @IBOutlet weak var coordinateLabel: UILabel!
  
   // MARK: - View Controller life cycle.
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Weather App"
    self.getLastSearchedWeather()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - View update methods.
  
  /**
   resetView method clears all the existing values from the views
   */
  
  func resetView()  {
    self.iconImageView.image = nil
    self.nameLabel.text = nil
    self.descriptionLabel.text = nil
    self.coordinateLabel.text = nil
    self.temparatureLabel.text = nil
  }
  
  /**
   updateView method updates the view with data passed
   
   - parameter icon: icon url
   - parameter description: weather description
   - parameter name: location name
   - parameter geoCoordinate: latitude and longitude value
   - parameter temperature: current, minimum and maximum temperature
   */
  
  func updateView(icon:String?, description:String?, name:String?, geoCoordinate:String?, temperature:String?)  {
    if let icon = icon {
      let url = URL(string: icon)!
      self.iconImageView.kf.setImage(with: url)
    }else {
      self.iconImageView.image = nil
    }
    self.nameLabel.text = name
    self.descriptionLabel.text = description
    self.coordinateLabel.text = geoCoordinate
    self.temparatureLabel.text = temperature
  }
  
  /**
   showError method shows the error description to the user
   
   - parameter error: error description
   */
  
  func showError(error:String?) {
    
    //previus weather value can be cleared here depending on requirement.
    print("error : \(String(describing: error))")
    let alertController = UIAlertController(title: "Error", message: error ?? "Unknown error", preferredStyle: UIAlertControllerStyle.alert)
    let cancelAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
      
    }
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true, completion: nil)
  }
  
  
  // MARK: - UISearchBar delegate
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    //Depending on Business logic - need to validate for empty text and also need to check whether the search text should be trimmed or not
    guard let text = searchBar.text else {
      return
    }
    //self.viewModel = CityWeatherViewModel()
    self.viewModel.getCityWeather(name: text, success: { (icon, description, name, geoCoordinate, temperature) in
      self.updateView(icon: icon, description: description, name: name, geoCoordinate: geoCoordinate, temperature: temperature)
    }, failure: { (error) in
        self.showError(error: error)
    })
  }
  
  
  // MARK: - functional methods
  
  /**
   getLastSearchedWeather method used to fetch last successfully searched weather result
   */
  
  func getLastSearchedWeather() {
    if let lastSearchedText = self.viewModel.getLastSearchedText(){
      self.viewModel.getCityWeather(name: lastSearchedText, success: { (icon, description, name, geoCoordinate, temperature) in
        self.updateView(icon: icon, description: description, name: name, geoCoordinate: geoCoordinate, temperature: temperature)
      }, failure: { (error) in
        self.showError(error: error)
      })
    }
  }
}


