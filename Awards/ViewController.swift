//
//  ViewController.swift
//  Awards
//
//  Created by Terretino on 15/09/19.
//  Copyright © 2019 Terretino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension UIColor {
    
    static let voucher = UIColor().colorFromHex("#2667D1")
    static let product = UIColor().colorFromHex("#D18615")
    static let giftCard = UIColor().colorFromHex("#12C91B")
    
    
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            return UIColor.black
        }
        var rgb: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat(rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
    }
}

extension UIView {
    func shapingView() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 1.5
        self.layer.shadowOffset = CGSize (width: 0, height: 1.5)
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
}
