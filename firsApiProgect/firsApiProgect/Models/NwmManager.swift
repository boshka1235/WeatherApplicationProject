//
//  NwmManager.swift
//  firsApiProgect
//
//  Created by Oatmeal Simon on 10/26/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import Foundation
import CoreLocation

class NetworkWeatherManager {
	
	enum RequestType {
		case cityName(city: String)
		case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
	}
	
	var onCompletion: ((CurrentWeather) -> Void)?
	
	
	func fetchCurrentWeather(forRequestType requestType: RequestType) {
		var urlString = ""
		switch requestType {
		case .cityName(let city):
			urlString =
				"https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
		case .coordinate(let latitude, let longitude):
			urlString =
				"https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
		}
		performRequest(withURLString: urlString)
	}

	fileprivate func performRequest(withURLString urlString: String) {
		guard let url = URL(string: urlString) else { return }
		let session = URLSession(configuration: .default)
		let task = session.dataTask(with: url) { data, response, error in
			if let data = data {
				if let currentWeather = self.parceJSON(withData: data) {
					self.onCompletion?(currentWeather)
				}
			}
		}
		task.resume()
	}
	
	func parceJSON(withData data: Data) -> CurrentWeather? {
		let decoder = JSONDecoder()
		do {
			let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
			guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
			return currentWeather
		} catch let error as NSError {
			print(error.localizedDescription)
		}
		return nil
	}
}
