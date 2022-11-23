//
//  UserModal.swift
//  UserApp
//
//  Created by srikanth on 11/1/22.
//

import Foundation

struct User: Codable {
    /// User Title
    var name: String
    /// User Email
    var email: String
    /// User unique id
    var id: Int
    
    /// User Address modal
    var address: Address
}


struct Address: Codable {
    /// User address, street
    var street: String
    /// User address, city
    var city: String
    /// User address, ZipCode
    var zipcode: String
    /// User address, suite
    var suite: String
}
