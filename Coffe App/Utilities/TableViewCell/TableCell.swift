//
//  TableCell.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 07.02.2024.
//

import Foundation
import UIKit

protocol TableCellInput: AnyObject {
    var title: String? {get set}
    var subTitle: String? {get set}
//    var isCountable: Bool { get set }
    var handler: ((UInt) -> Void)? { get set }
}

final class TableCell: UITableViewCell {
    
    enum CellStyle {
        case forCoffeehouses
        case forOrder
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.tableColor
        view.layer.cornerRadius = 5.0
        view.layer.shadowColor = CGColor(gray: 20, alpha: 1)
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowRadius = 2.0
        view.layer.shadowOpacity = 0.25
        view.layer.masksToBounds = false
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
    private lazy var nameLabel = CreateLabele(
        nameLabel: "",
        size: 18,
        color: Constants.Colors.textBrownColor
    )
    
    private lazy var counter: CountValueView = {
        let view = CountValueView(with: .forTable)
        view.delegate = self
        return view
    }()
    
    private var style: CellStyle = .forCoffeehouses {

        didSet {
            switch style {
            case .forCoffeehouses:
                counter.isHidden = true
            case .forOrder:
                counter.isHidden = false
            }
            layoutIfNeeded()
        }
    }
    
    
    private func setupView(){
        contentView.addSubview(backView)
        backView.addSubview(nameLabel)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension TableCell: CountValueDelegate {
    func didChanged(count: UInt) {
        
    }
}
