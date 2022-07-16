//
//  Factories.swift
//  Custom Views
//
//  Created by kenjimaeda on 16/07/22.
//
import UIKit
import Foundation



func makeLabel(_ text:String,_ color: UIColor,_ fontSize:CGFloat) ->UILabel {
	let label = UILabel()
	label.translatesAutoresizingMaskIntoConstraints = false
	label.font = UIFont.systemFont(ofSize: fontSize)
	label.textColor = color
	label.text = text
	label.numberOfLines = 0	//multiline
	return label
}

func makeSwitch(_ isOn: Bool) -> UISwitch {
	let customSwitch =  UISwitch()
	customSwitch.translatesAutoresizingMaskIntoConstraints = false
	customSwitch.isOn = isOn
	return customSwitch
}

func makeProgress () -> UIProgressView {
	let progress = UIProgressView(progressViewStyle: .default)
	progress.translatesAutoresizingMaskIntoConstraints = false
	progress.tintColor = .gray
	return progress
}

func makeStackViews (_ axis: NSLayoutConstraint.Axis) -> UIStackView {
	let stack = UIStackView()
	stack.translatesAutoresizingMaskIntoConstraints = false
	stack.axis = axis
	stack.distribution = .fill
	stack.alignment = .fill
  return stack
	
}
