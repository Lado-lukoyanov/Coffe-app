//
//  Helpers.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//
import UIKit

class CreateTextFiled: UITextField {

    private let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 40)

    init(placeholder: String, height: CGFloat) {
        super.init(frame: .zero)
        setupTextFiled(placeholder: placeholder, height: height)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - Override

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by:padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
        
    }
//MARK: - Private

    private func setupTextFiled(placeholder: String, height: CGFloat) {
        textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.cornerRadius = 24
        layer.borderWidth = 2
        layer.borderColor = Constants.Colors.PlaceHolderColor.cgColor
        layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: Constants.Colors.PlaceHolderColor])
        
        heightAnchor.constraint(equalToConstant: height).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class CreateLabele : UILabel {
    init(nameLabel: String, size: CGFloat, color: UIColor) {
        super.init(frame: .zero)
        setupLabel(nameLabel: nameLabel, size: size, color: color )
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private
    private func setupLabel(nameLabel: String, size: CGFloat, color: UIColor ) {
        textColor = color
        font = UIFont.boldSystemFont(ofSize: size)
        text = nameLabel
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}

class CreateButton: UIButton {
    
    init(name: String, color: UIColor, textColor: UIColor) {
        super.init(frame: .zero)
        setupButton(name: name, color: color, textColor: textColor)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private
    private func setupButton(name: String, color: UIColor, textColor: UIColor) {
        backgroundColor = color
        titleLabel?.font = UIFont.systemFont(ofSize: 18)
        setTitle(name, for: .normal)
        layer.cornerRadius = 25
        setTitleColor(textColor, for: .normal)
        heightAnchor.constraint(equalToConstant: 47).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
            
    }
    
}

