//
//  MainPageController.swift
//  Awards
//
//  Created by Terretino on 15/09/19.
//  Copyright © 2019 Terretino. All rights reserved.
//

import UIKit

class MainPageController: UIViewController {
    
    var topView: UIView?
    let transition = TransitionSlide()
    let rewardList = RewardList()
    var listOfRewards = RewardList().setReward()
    var pageLimit = 4
    let totalReward = 100
    var filterArray = [String]()
    var filterPoint = 0
    var filteredReward: [Reward] = []
    
    @IBOutlet weak var mainPageTableView: UITableView!
    
    @objc func reloadReward(){
        mainPageTableView.reloadData()
    }
    
    @IBAction func menuButton(_ sender: Any) {
        guard let mainMenuViewController = storyboard?.instantiateViewController(withIdentifier: "MainMenuStoryboard") else {
            return
        }
        mainMenuViewController.modalPresentationStyle = .overCurrentContext
        mainMenuViewController.transitioningDelegate = self
        present(mainMenuViewController, animated: true)
    }
    
    @IBAction func didGetFilter(_ sender: UIStoryboardSegue) {
        guard let filterPage = sender.source as? FilterViewController else {return}
        filterPoint = filterPage.poinSliderFilter
        filterArray = filterPage.typeFilterArray
        filteredReward = filterReward(typeFilter: filterArray, poinFilter: filterPoint)
        mainPageTableView.reloadData()
    }
    
    func filterReward(typeFilter: [String], poinFilter: Int) -> [Reward] {
        var filteredReward = [Reward]()
        for item in listOfRewards {
            if typeFilter.isEmpty {
                if poinFilter <= item.poin {
                    filteredReward.append(item)
                }
            } else {
                if typeFilter.contains(item.type) && poinFilter <= item.poin {
                    filteredReward.append(item)
                }
                
            }
        }
        return filteredReward
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainPageTableView.delegate = self
        mainPageTableView.dataSource = self
    }
    
}

extension MainPageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredReward.isEmpty {
            return filteredReward.count
        } else {
            return listOfRewards.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainPageCell") as! MainPageViewCellControllerTableViewCell
        
        if !filteredReward.isEmpty {
            if filteredReward[indexPath.row].type == "Voucher" {
                cell.rewardType.backgroundColor = .voucher
            } else if filteredReward[indexPath.row].type == "Product" {
                cell.rewardType.backgroundColor = .product
            } else if filteredReward[indexPath.row].type == "Gift Card" {
                cell.rewardType.backgroundColor = .giftCard
            }
            
            cell.rewardType.text = filteredReward[indexPath.row].type
            cell.rewardDesc.text = "\(filteredReward[indexPath.row].poin)"
            cell.rewardPrice.text = filteredReward[indexPath.row].price
            
        } else {
            if listOfRewards[indexPath.row].type == "Voucher" {
                cell.rewardType.backgroundColor = .voucher
            } else if listOfRewards[indexPath.row].type == "Product" {
                cell.rewardType.backgroundColor = .product
            } else if listOfRewards[indexPath.row].type == "Gift Card" {
                cell.rewardType.backgroundColor = .giftCard
            }
            
            cell.rewardType.text = listOfRewards[indexPath.row].type
            cell.rewardDesc.text = "\(listOfRewards[indexPath.row].poin)"
            cell.rewardPrice.text = listOfRewards[indexPath.row].price
            
        }
        cell.rewardType.shapingView()
        cell.contentReward.shapingView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !filteredReward.isEmpty {
            if indexPath.row == filteredReward.count - 1 {
                if filteredReward.count < totalReward {
                    var index = filteredReward.count
                    pageLimit = index + 4
                    
                    while index < pageLimit {
                        filteredReward = filteredReward + rewardList.setRewardExtra()
                        filteredReward = filterReward(typeFilter: filterArray, poinFilter: filterPoint)
                        print(filterArray)
                        index = index + 1
                    }
                    self.perform(#selector(reloadReward), with: nil, afterDelay: 1.0)
                }
            }
        } else {
            if indexPath.row == listOfRewards.count - 1 {
                if listOfRewards.count < totalReward {
                    var index = listOfRewards.count
                    pageLimit = index + 4
                    while index < pageLimit {
                        listOfRewards += rewardList.setRewardExtra()
                        index = index + 1
                    }
                    self.perform(#selector(reloadReward), with: nil, afterDelay: 1.0)
                }
            }
        }
    }
}


extension MainPageController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }


    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

