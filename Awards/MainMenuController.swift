//
//  MainMenuController.swift
//  Awards
//
//  Created by Terretino on 16/09/19.
//  Copyright © 2019 Terretino. All rights reserved.
//

import UIKit
import Foundation

class MainMenuController: UIViewController {

    @IBOutlet var menuView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    let mainMenu = ["Home", "Cards", "Profile", "Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    
}

extension MainMenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainMenuCell") as! MainMenuTableViewcCell
        cell.menuText.text = mainMenu[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.dismiss(animated: true, completion: nil)
        } else if indexPath.row == 3 {
            guard let mainMenuViewController = storyboard?.instantiateViewController(withIdentifier: "WelcomePage") else {return}
            present(mainMenuViewController, animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //location is relative to the current view
        var touch: UITouch? = touches.first
        // do something with the touched point
        if touch?.view == menuView {
             self.dismiss(animated: true, completion: nil)
        }

    }
}
