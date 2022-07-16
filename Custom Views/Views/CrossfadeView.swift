//
//  CrossfadeView.swift
//  Custom Views
//
//  Created by kenjimaeda on 16/07/22.
//

import UIKit

class CrossfadeView: UIView  {
	
	
	init() {
		super.init(frame: .zero)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews() {
		let label =  makeLabel("Crossfade", .white, 17)
		let startProgress = makeLabel("0s", .gray, 14)
		let endProgress = makeLabel("12s", .gray, 14)
		let progress = makeProgress()
		
		addSubview(label)
		addSubview(startProgress)
		addSubview(endProgress)
		addSubview(progress)
		
		NSLayoutConstraint.activate([
			//se estivem em views diferentes nao precisa colocar
			//startProgress abaixo do label
			label.topAnchor.constraint(equalTo: topAnchor),
			label.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			startProgress.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 8),
			startProgress.leadingAnchor.constraint(equalTo: leadingAnchor),
			startProgress.trailingAnchor.constraint(equalTo: progress.leadingAnchor,constant: -4),
			
			progress.centerYAnchor.constraint(equalTo: startProgress.centerYAnchor),
			progress.trailingAnchor.constraint(equalTo: endProgress.leadingAnchor,constant: -4),
			
			endProgress.centerYAnchor.constraint(equalTo: progress.centerYAnchor),
			endProgress.trailingAnchor.constraint(equalTo: trailingAnchor),

		])
		
	}
	
	override var intrinsicContentSize: CGSize {
		return CGSize(width: 200, height: 100)
	}
}
