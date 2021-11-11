//
//  WeatherView.swift
//  firsApiProgect
//
//  Created by Oatmeal Simon on 11/11/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import UIKit
class WeatherView: UIView {

	private let mainView = UIView()
	
	var delegate: ResultDelegate?
	
	private lazy var resultButton: UIButton = {
		let resultButton = UIButton()
		resultButton.setTitle("Get temperature", for: .normal)
		resultButton.setTitleColor(.black, for: .normal)
		resultButton.backgroundColor = .cyan
		resultButton.layer.cornerRadius = 5
		resultButton.layer.masksToBounds = true
		resultButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
		return resultButton
	}()

	private lazy var tempLabel: UILabel = {
		let resultLabel = UILabel()
		resultLabel.textAlignment = .center
		resultLabel.layer.cornerRadius = 5
		resultLabel.layer.masksToBounds = true
		return resultLabel
	}()

	private lazy var likeWhatTempLabel: UILabel = {
		let resultLabel = UILabel()
		resultLabel.textAlignment = .center
		resultLabel.layer.cornerRadius = 5
		resultLabel.layer.masksToBounds = true
		return resultLabel
	}()

	private lazy var cityLabel: UILabel = {
		let resultLabel = UILabel()
		resultLabel.textAlignment = .center
		resultLabel.layer.cornerRadius = 5
		resultLabel.layer.masksToBounds = true
		return resultLabel
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		createMainView()
		createResultButton()
		createTempLabel()
		createLikeWhatTempLabel()
		createCityLabel()
	}
	
	private func createMainView() {
		anchorHelper(label: mainView, parentLabel: self, topAnchorLabel: self.topAnchor, bottomAnchorLabel: self.bottomAnchor, leadingAnchorLabel: self.leadingAnchor, trailingAnchorLabel: self.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: 0, backgroundColor: .white)
	}
	
	private func createResultButton() {
		anchorHelper(label: resultButton, parentLabel: mainView, topAnchorLabel: mainView.topAnchor, bottomAnchorLabel: mainView.bottomAnchor, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 650, leadingConstant: 107, trailingConstant: -107, widthConstant: nil, heightConstant: 50, bottomAnchor: nil, backgroundColor: .cyan)
	}
	
	private func createTempLabel() {
		anchorHelper(label: tempLabel, parentLabel: mainView, topAnchorLabel: mainView.topAnchor, bottomAnchorLabel: mainView.bottomAnchor, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 130, leadingConstant: 107, trailingConstant: -107, widthConstant: nil, heightConstant: 50, bottomAnchor: nil, backgroundColor: .lightGray)
	}
	
	private func createLikeWhatTempLabel() {
		anchorHelper(label: likeWhatTempLabel, parentLabel: mainView, topAnchorLabel: mainView.topAnchor, bottomAnchorLabel: mainView.bottomAnchor, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 230, leadingConstant: 107, trailingConstant: -107, widthConstant: nil, heightConstant: 50, bottomAnchor: nil, backgroundColor: .lightGray)
	}

	private func createCityLabel() {
		anchorHelper(label: cityLabel, parentLabel: mainView, topAnchorLabel: mainView.topAnchor, bottomAnchorLabel: mainView.bottomAnchor, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 330, leadingConstant: 107, trailingConstant: -107, widthConstant: nil, heightConstant: 50, bottomAnchor: nil, backgroundColor: .lightGray)
	}
	
	func updeteInterfaceWith(weather: CurrentWeather) {
		DispatchQueue.main.async {
			self.cityLabel.text = weather.cityName
			self.tempLabel.text = weather.temperatureString
			self.likeWhatTempLabel.text = weather.feelsLikeTemperatureString
		}
	}
	
	@objc func showAlert(){
			delegate?.showAlert()
		}
	
}
