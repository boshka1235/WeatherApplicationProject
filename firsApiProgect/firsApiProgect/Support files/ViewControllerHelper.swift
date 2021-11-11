//
//  ViewControllerHelper.swift
//  firsApiProgect
//
//  Created by Oatmeal Simon on 10/27/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import Foundation
import UIKit

extension ApiController {
	func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping(String) -> Void) {
		let allertController = UIAlertController(title: title, message: message, preferredStyle: style)
		allertController.addTextField { (textfield) in textfield.placeholder = "Enter address" }
				
				
				let submit = UIAlertAction(title: "Submit", style: .default) { action in
					let addres = allertController.textFields?.first
					guard let cityName = addres?.text else { return }
					if cityName != "" {
						let city = cityName.split(separator: " ").joined(separator: "%20")
						completionHandler(city)
					}
				}
				
				let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
				allertController.addAction(submit)
				allertController.addAction(cancel)
				present(allertController, animated: true, completion: nil)
			
	}
}

