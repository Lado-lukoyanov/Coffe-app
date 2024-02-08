//
//  CountValueView.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 07.02.2024.
//

import UIKit

protocol CountValueDelegate: AnyObject {
    func didChanged(count: UInt)
}

final class CountValueView: UIView {
    enum Style {
           case forCollection
           case forTable
       }
    
    private lazy var plusButtonTable = CreateButton(name: "+", style: .forTable)
    private lazy var minusButtonTable = CreateButton(name: "-", style: .forTable)
    
    private lazy var plusButtonCollection = CreateButton(name: "+", style: .forTable)
    private lazy var minusButtonCollection = CreateButton(name: "-", style: .forTable)
    
    private lazy var countLabel = CreateLabele(nameLabel: "1", size: 14, color: Constants.Colors.textBrownColor)
    
    private lazy var horizontStack: UIStackView = {
        let stack = UIStackView()
        switch style {
        case.forTable:
            stack.addArragedSubwies(plusButtonTable,countLabel,minusButtonTable)
        case .forCollection:
            stack.addArragedSubwies(plusButtonCollection,countLabel, minusButtonCollection)
        }
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private var style: Style
    
    private var count: UInt = 1 {
        didSet {
            countLabel.text = "\(count)"
        }
    }
    
    weak var delegate: CountValueDelegate?
    
    private override init(frame: CGRect) {
        style = .forTable
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(with style: Style) {
        self.init(frame: .zero)
        self.style = style
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        addSubview(horizontStack)
        minusButtonCollection.addTarget(self, action:#selector(minusButtonAction), for: .touchUpInside)
        plusButtonCollection.addTarget(self, action:#selector(plusButtonAction), for: .touchUpInside)
        
    }

       private func setupConstraints() {
           let size = CGSize(width: 72.0, height: 24.0)
           
           NSLayoutConstraint.activate([
            
            horizontStack.leadingAnchor.constraint(equalTo: horizontStack.superview!.leadingAnchor),
            horizontStack.trailingAnchor.constraint(equalTo: horizontStack.superview!.trailingAnchor),
            horizontStack.topAnchor.constraint(equalTo: horizontStack.superview!.topAnchor),
            horizontStack.bottomAnchor.constraint(equalTo: horizontStack.superview!.bottomAnchor),

            horizontStack.widthAnchor.constraint(equalToConstant: size.width),
            horizontStack.heightAnchor.constraint(equalToConstant: size.height)
           ])

       }

       @objc func minusButtonAction() {
           count -= 1
           delegate?.didChanged(count: count)
       }

       @objc func plusButtonAction() {
           count += 1
           delegate?.didChanged(count: count)
       }
}
