//
//  UserCustomCell.swift
//  UserApp
//
//  Created by srikanth on 11/1/22.
//

import Foundation
import UIKit


class UserCustomCell: UITableViewCell{
    /// username label outlet
    @IBOutlet weak var userNameLbl: UILabel?
    /// email label outlet
    @IBOutlet weak var userEmailLbl: UILabel?
    /// address label outlet
    @IBOutlet weak var userAddressLbl: UILabel?
    
    /// user object for each cell
    var user: User?{
        didSet {
            if let user = user {
                
                /// set name label
                userNameLbl?.attributedText = Utility.attributedText(actualString: Utility.localize(string: "Name_Label", comment: nil) + user.name, boldString: Utility.localize(string: "Name_Label", comment: nil), font: UIFont.systemFont(ofSize: font16))
                
                /// set email label
                userEmailLbl?.attributedText = Utility.attributedText(actualString: Utility.localize(string: "Email_Label", comment: nil) + user.email, boldString: Utility.localize(string: "Email_Label", comment: nil), font: UIFont.systemFont(ofSize: font16))
                
                /// set address label, combined Street, Suite, City & Zipcode
                userAddressLbl?.attributedText = Utility.attributedText(actualString: Utility.localize(string: "Address_Label", comment: nil) + newLine + "\(user.address.street),  \(user.address.suite)" + newLine + "\(user.address.city), \(user.address.zipcode)", boldString: Utility.localize(string: "Address_Label", comment: nil), font: UIFont.systemFont(ofSize: font16))
            }
        }
    }
}
