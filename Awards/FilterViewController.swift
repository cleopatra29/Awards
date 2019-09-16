//
//  FilterViewController.swift
//  Awards
//
//  Created by Terretino on 16/09/19.
//  Copyright © 2019 Terretino. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet weak var typeFilter: UILabel!
    @IBOutlet weak var poinFilter: UILabel!
    @IBOutlet weak var clearAll: UILabel!
    @IBOutlet weak var poinSlider: UISlider!
    @IBOutlet weak var allTypeFilterBtn: UIButton!
    @IBOutlet weak var voucherTypeFilterBtn: UIButton!
    
    @IBOutlet weak var minSliderValue: UILabel!
    @IBOutlet weak var othersTypeFilterBtn: UIButton!
    @IBOutlet weak var productTypeFilterBtn: UIButton!
    
    @IBOutlet weak var maxSliderValue: UILabel!
    var typeFilterArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minSliderValue.text = "\(poinSlider.minimumValue)"
        maxSliderValue.text = "\(poinSlider.maximumValue)"

    }
    
    var poinSliderFilter = 0
    
    @IBAction func poinSlider(_ sender: UISlider) {
        poinFilter.text = "IDR \(Int(sender.value)) - IDR \(poinSlider.maximumValue)"
        minSliderValue.text = "\(Int(sender.value))"
        poinSliderFilter = Int(sender.value)
    }
    
    @IBAction func allTypeBtnFilter(_ sender: Any) {
        if !typeFilterArray.contains("Product") || !typeFilterArray.contains("Voucher") || !typeFilterArray.contains("Gift Card") {
            
            if !typeFilterArray.contains("Product") {
                typeFilterArray.append("Product")
                print(typeFilterArray)
            }
            
            if !typeFilterArray.contains("Voucher") {
                typeFilterArray.append("Voucher")
                print(typeFilterArray)
            }
            
            if !typeFilterArray.contains("Gift Card") {
                typeFilterArray.append("Gift Card")
                print(typeFilterArray)
            }
            
        } else {
            typeFilterArray.removeAll()
            print(typeFilterArray)

        }
        typeFilter.text = "Type: \(typeFilterArray.joined(separator: ", "))"
    }
    
    @IBAction func productsTypeBtnFilter(_ sender: Any) {
        
        if !typeFilterArray.contains("Product") {
            typeFilterArray.append("Product")
            print(typeFilterArray)

        } else {
            for i in 0...typeFilterArray.count {
                if typeFilterArray[i] == "Product" {
                    typeFilterArray.remove(at: i)
                    print(typeFilterArray)
                    break
                }
            }
        }
        typeFilter.text = "Type: \(typeFilterArray.joined(separator: ", "))"
    }
    
    @IBAction func voucherTypeBtnFilter(_ sender: Any) {
        if !typeFilterArray.contains("Voucher") {
            typeFilterArray.append("Voucher")
            print(typeFilterArray)

        } else {
            for i in 0...typeFilterArray.count {
                if typeFilterArray[i] == "Voucher" {
                    typeFilterArray.remove(at: i)
                    print(typeFilterArray)
                    break
                }
            }
        }
        typeFilter.text = "Type: \(typeFilterArray.joined(separator: ", "))"
    }
    
    @IBAction func othersTypeBtnFilter(_ sender: Any) {
        if !typeFilterArray.contains("Gift Card") {
            typeFilterArray.append("Gift Card")
            print(typeFilterArray)

        } else {
            for i in 0...typeFilterArray.count {
                if typeFilterArray[i] == "Gift Card" {
                    typeFilterArray.remove(at: i)
                    print(typeFilterArray)
                    break
                }
            }
        }
        typeFilter.text = "Type: \(typeFilterArray.joined(separator: ", "))"
    }
}

