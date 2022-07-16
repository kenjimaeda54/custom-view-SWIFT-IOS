//
//  RowView.swift
//  Custom Views
//
//  Created by kenjimaeda on 16/07/22.
//

import UIKit

class RowView: UIView {
	let text: String
	let colorText: UIColor
	let fontText: CGFloat
	let isOn: Bool
	
	init(_ text: String, _ colorText: UIColor, _ fontText: CGFloat,_ isOn: Bool) {
		self.text = text
		self.colorText = colorText
		self.fontText = fontText
		self.isOn = isOn
		super.init(frame: .zero)
		setupViews()
	}
	
	required  init?(coder aDecoder: NSCoder) {
		fatalError("init (coder:) has not been implemented")
	}
	
	func setupViews() {
		let label = makeLabel(text,colorText,fontText)
		let switchComponent = makeSwitch(isOn)
		
		addSubview(label)
		addSubview(switchComponent)
		
		NSLayoutConstraint.activate([
			
			label.topAnchor.constraint(equalTo: topAnchor),
			label.leadingAnchor.constraint(equalTo: leadingAnchor),
			
			switchComponent.centerYAnchor.constraint(equalTo: label.centerYAnchor),
			switchComponent.trailingAnchor.constraint(equalTo: trailingAnchor),
			
		])
		
	}
	
	// A suggestion about size. But one that can be overridden.
	override var intrinsicContentSize: CGSize {
		return CGSize(width: 200, height: 31)
	}
	
	
}



