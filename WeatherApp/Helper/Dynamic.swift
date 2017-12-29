//
//  Dynamic.swift
//  WeatherApp
//
//  Created by Raghunath, Karthik Raja (Contractor) on 12/28/17.
//  Copyright © 2017 Raghunath, Karthik Raja (Contractor). All rights reserved.
//

import Foundation

class Dynamic<T> {
  typealias Listener = (T) -> ()
  var listener : Listener?
  
  /**
   binds the listener
   */
  func bind(listener: Listener?) {
    self.listener = listener
  }
  
  /**
   binds the listener and triggers it.
   */
  func bindFire(listener : Listener?) {
    self.listener = listener
    listener?(value)
  }
  
  var value : T {
    didSet {
      listener?(value)
    }    
  }
  
  init(value:T) {
    self.value = value
  }
  
}
