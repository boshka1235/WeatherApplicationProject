//
//  ApiController.swift
//  firsApiProgect
//
//  Created by Oatmeal Simon on 10/26/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class ApiController: UIViewController {
	
	lazy var locationManager: CLLocationManager = {
		let lManager = CLLocationManager()
		lManager.delegate = self
		lManager.desiredAccuracy = kCLLocationAccuracyKilometer
		lManager.requestWhenInUseAuthorization()
		return lManager
	}()
	
	private var networkWeatherManager = NetworkWeatherManager()
	
	private let myView = WeatherView()
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		myView.delegate = self
		addMyView()
		networkWeatherManager.onCompletion = { [weak self] currentWeather in
			guard let self = self else {
				return
			}
			self.myView.updeteInterfaceWith(weather: currentWeather)
			print(currentWeather.cityName)
		}
		
		if CLLocationManager.locationServicesEnabled() {
			locationManager.requestLocation()
		}
		
		
	}
	
	private func addMyView() {
		anchorHelper(label: myView, parentLabel: view, topAnchorLabel: view.topAnchor, bottomAnchorLabel: view.bottomAnchor, leadingAnchorLabel: view.leadingAnchor, trailingAnchorLabel: view.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: 0)
	}
	
}

extension ApiController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let location = locations.last else { return }
		let latitude = location.coordinate.latitude
		let longitude = location.coordinate.longitude
		
		networkWeatherManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(error.localizedDescription)
	}
}

extension ApiController: ResultDelegate {
	@objc func showAlert() {
		self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
			self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
	}
}

}
