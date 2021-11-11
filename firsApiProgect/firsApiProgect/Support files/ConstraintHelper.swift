//
//  ConstraintHelper.swift
//  firsApiProgect
//
//  Created by Oatmeal Simon on 10/26/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import Foundation
import UIKit

func anchorHelper(
	label: UIView,
	parentLabel: UIView,
	topAnchorLabel: NSLayoutYAxisAnchor?,
	bottomAnchorLabel: NSLayoutYAxisAnchor?,
	leadingAnchorLabel: NSLayoutXAxisAnchor?,
	trailingAnchorLabel: NSLayoutXAxisAnchor?,
	topAnchor: CGFloat?,
	leadingConstant: CGFloat?,
	trailingConstant: CGFloat?,
	widthConstant: CGFloat?,
	heightConstant: CGFloat?,
	bottomAnchor: CGFloat?,
	backgroundColor: UIColor = .white
)  {
	label.backgroundColor = backgroundColor
	label.translatesAutoresizingMaskIntoConstraints = false
	parentLabel.addSubview(label)
	
	if topAnchor != nil {
		label.topAnchor.constraint(equalTo: topAnchorLabel!, constant: topAnchor!).isActive = true
	}
	
	if bottomAnchor != nil {
		label.bottomAnchor.constraint(equalTo: bottomAnchorLabel!, constant: bottomAnchor!).isActive = true
	}
	
	if leadingConstant != nil {
		label.leadingAnchor.constraint(equalTo: leadingAnchorLabel!, constant: leadingConstant!).isActive = true
	}
	
	if trailingConstant != nil {
		label.trailingAnchor.constraint(equalTo: trailingAnchorLabel!, constant: trailingConstant!).isActive = true
	}
	
	if widthConstant != nil {
		label.widthAnchor.constraint(equalToConstant: widthConstant!).isActive = true
	}
	
	if heightConstant != nil {
		label.heightAnchor.constraint(equalToConstant: heightConstant!).isActive = true
	}
	
}
