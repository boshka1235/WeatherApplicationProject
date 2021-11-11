//
//  CurrentWeather.swift
//  firsApiProgect
//
//  Created by Oatmeal Simon on 10/27/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import Foundation

struct CurrentWeather {
	let cityName: String
	
	
	let temperature: Double
	var temperatureString: String {
		return String(format: "%.0f", temperature)
	}
	
	let feelsLikeTemperature: Double
	var feelsLikeTemperatureString: String {
		return String(format: "%.0f", feelsLikeTemperature)
	}
	
	let conditionCode: Int
	
	init?(currentWeatherData: CurrentWeatherData) {
		cityName = currentWeatherData.name
		temperature = currentWeatherData.main.temp
		feelsLikeTemperature = currentWeatherData.main.feelsLike
		conditionCode = currentWeatherData.weather.first!.id
	}
}
