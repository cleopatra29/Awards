//
//  ModelRewardList.swift
//  Awards
//
//  Created by Terretino on 15/09/19.
//  Copyright © 2019 Terretino. All rights reserved.
//

import Foundation

class RewardList {
    let reward1 = Reward(image: nil, type: "Voucher", poin: 500000, price: "Gift Card IDR 1.000.000")
    let reward2 = Reward(image: nil, type: "Voucher", poin: 750000, price: "Gift Card IDR 2.000.000")
    let reward3 = Reward(image: nil, type: "Product", poin: 200000, price: "Game Balance Book")
    let reward4 = Reward(image: nil, type: "Gift Card", poin: 800000, price: "Gift Card 500.000")
    let reward5 = Reward(image: nil, type: "Gift Card", poin: 450000, price: "Gift Card 150.000")
    let reward6 = Reward(image: nil, type: "Gift Card", poin: 500000, price: "Gift Card 200.000")
    let reward7 = Reward(image: nil, type: "Voucher", poin: 500000, price: "Gift Card IDR 1.000.000")
    let reward8 = Reward(image: nil, type: "Voucher", poin: 500000, price: "Gift Card IDR 1.000.000")
    let reward9 = Reward(image: nil, type: "Voucher", poin: 500000, price: "Gift Card IDR 1.000.000")
    let reward10 = Reward(image: nil, type: "Voucher", poin: 500000, price: "Gift Card IDR 1.000.000")
    let reward11 = Reward(image: nil, type: "Voucher", poin: 500000, price: "Gift Card IDR 1.000.000")
    
    func setReward() -> [Reward] {
        let rewardList = [reward1, reward2, reward3, reward4]
        return rewardList
    }
    
    func setRewardExtra() -> [Reward] {
        let rewardList = [reward5, reward6, reward7, reward8]
        return rewardList
    }
    
}
