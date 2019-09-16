//
//  ModelEmailList.swift
//  Awards
//
//  Created by Terretino on 15/09/19.
//  Copyright © 2019 Terretino. All rights reserved.
//

import Foundation

class EmailList{
    
    let email1 = Email(initEmail: "terretino@email.com")
    let email2 = Email(initEmail: "adistria@email.com")
    let email3 = Email(initEmail: "gelgel@email.com")
    
    func getEmail() -> [String] {
        let emailList = [email1.email, email2.email, email3.email]
        return emailList 
    }
    
}
