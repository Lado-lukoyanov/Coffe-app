//
//  Constants.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation
import UIKit
// создание шрифтов и цвета в перечеслении
enum Constants {
    
    enum Colors {
        static var MainColor: UIColor {
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        static var PlaceHolderColor: UIColor {
            return #colorLiteral(red: 0.6862745098, green: 0.5803921569, blue: 0.4745098039, alpha: 1)
        }
        
        static var textBrownColor: UIColor {
            return #colorLiteral(red: 0.5176470588, green: 0.3882352941, blue: 0.2509803922, alpha: 1)
        }
        static var ButtunBrownColor: UIColor {
            return #colorLiteral(red: 0.2039215686, green: 0.1764705882, blue: 0.1019607843, alpha: 1)
        }
        
        static var navBackColor: UIColor {
            return #colorLiteral(red: 0.9845256209, green: 0.981387794, blue: 0.9813215137, alpha: 1)
        }
    }
    
    enum Text {
        static let email = "e-mail"
        static let emailText = "example@example.ru"
    
        static let password = "Пароль"
        static let returnPassword = "Повторите пароль"
        static let registration  = "Регистрация"
        static let auth = "Вход"
        static let authButton = "Войти"
        static let coffeShop = "Ближайшие кофейни"
        static let inMap = "На карте"
        static let map  = "Карта"
        static let menu = "Меню"
        static let checkPay = "Перейти к оплате"
        static let payScreen = "Ваш заказ"
        static let payButton = "Оплатить"
    }
    
    enum Image {
        static let star = UIImage(named: "Star")
        
    }
}

//Время ожидания заказа 15 минут! Спасибо, что выбрали нас!
