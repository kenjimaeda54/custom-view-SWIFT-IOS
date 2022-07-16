# Custom View com stack
Pequena interface para entender o uso de criacao de views customizadas e stack view


## Feature
- Usei conceito de herança para construir views customizadas
- Assim facilito a  componentização diminuindo a quantidade de código, criei um componente que possui um Switch e Label
- Essa classe com esses dois componentes  genéricos, podem receber qualquer propriedade para o Switch e label, unica coisa de fato que eram fixas e suas posições em relação a view
- Eles foram alinhados no mesmo eixo y e distância betwen em relação a view
- Com essa abordagem reduzi bastante código, quem utilizar essa classe precisa apenas passar as propriedade para switch e label, restante classe assumira


``` swift
//quem ira consumir
	
let offlineLabel = RowView("Offline", .white, 17, false)
let playback = RowView("Gappless Playback", .white,17,true)
let unplayableSongs = RowView("Hide Unplayable Songs",.white,17, true)
let enableAudio = RowView("Ennable Audio Normalization", .white, 17, true)


///===========================

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

```

## 
- Para alinhar todos os componentes utilizaram o princípio de stack view
- Stack respeitara a posição que os componentes foram ordenados
- Exemplo a variável que instancia a classe CorssfadeView, precisa estar abaixo do descriptionLabel, porque e um componente que na interface precisa assumir essa posição
- Se por exemplo crossfadeView estiver abaixo de todas ela se posicionara abaixo 
- Os espaçamentos entre as diferentes classes acontece pela propriedade spacing do stack view
- Não preciso determinar o bottom do stack view, ele por padrão sera full strach 

```swift


    ┌────────StackView─────────┐
    │                          │
    │        offlineRow        │
    │                          │
    │      offlineSublabel     │
    │                          │   axis = vertical
    │       crossfadeView      │   distribution = fill
    │                          │   alignment = fill
    │        gaplessRow        │   spacing = 20
    │                          │
    │       hideSongsRow       │
    │                          │
    │     normalizationRow     │
    │                          │
    └──────────────────────────┘




//
//  ViewController.swift
//  Custom Views
//
//  Created by kenjimaeda on 16/07/22.
//

import UIKit

class ViewController: UIViewController {
  
	override func viewDidLoad() {
		super.viewDidLoad()
    setupViews()
		setupNavigationBar()
	}
	
	func setupNavigationBar() {
				navigationItem.title = "Playback"
		}
	
	func setupViews() {

		
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

```




