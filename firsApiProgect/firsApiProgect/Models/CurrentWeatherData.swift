//
//  CurrentWeatherData.swift
//  firsApiProgect
//
//  Created by Oatmeal Simon on 10/27/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import Foundation

struct CurrentWeatherData: Codable {
	let name: String
	let main: Main
	let weather: [Weather]
}

struct Main: Codable {
	let temp: Double
	let feelsLike: Double
	
	enum CodingKeys: String, CodingKey {
		case temp
		case feelsLike = "feels_like"
	}
}

struct Weather: Codable {
	let id: Int
}
