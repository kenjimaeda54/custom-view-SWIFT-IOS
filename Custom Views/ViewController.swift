//
//  ViewController.swift
//  Custom Views
//
//  Created by kenjimaeda on 16/07/22.
//

import UIKit

class ViewController: UIViewController {
  

	//nao precisa do posistionm bottom porque por padrao stack view
	//sera full stretch
	override func viewDidLoad() {
		super.viewDidLoad()
    setupViews()
		setupNavigationBar()
	}
	
	func setupNavigationBar() {
				navigationItem.title = "Playback"
		}
	
	func setupViews() {
		//com essa abordagem diminuo muito codigo
		
		let stackView = makeStackViews(.vertical)
		view.backgroundColor = UIColor.offBlack
		//vertical spacing entre as classes
		//no  caso entre classe CrossfadeView() e RowView()
		stackView.spacing = 20
		
		let offlineLabel = RowView("Offline", .white, 17, false)
		let descriptionLabel = makeLabel("When you go offline, you'll only be able to play the music and podcasts you've downloaded.", .gray, 14)
		let playback = RowView("Gappless Playback", .white,17,true)
		let unplayableSongs = RowView("Hide Unplayable Songs",.white,17, true)
		let enableAudio = RowView("Ennable Audio Normalization", .white, 17, true)
		
		let crossfadeView = CrossfadeView()
		
		//precisa sera possicao correta dos compontes
		//nossa tela o crossfadeView esta abaixo de descriptoinLabel
		stackView.addArrangedSubview(offlineLabel)
		stackView.addArrangedSubview(descriptionLabel)
		stackView.addArrangedSubview(crossfadeView)
		stackView.addArrangedSubview(playback)
		stackView.addArrangedSubview(unplayableSongs)
		stackView.addArrangedSubview(enableAudio)

		
		view.addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	
		//padding and spacing
		stackView.isLayoutMarginsRelativeArrangement = true
		stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
		
	}


}

