//
//  UsersViewModal.swift
//  UserApp
//
//  Created by srikanth on 11/1/22.
//

import Foundation
import ServiceKit

class UserViewModal: NSObject {
    var apiHandler: ServiceHandler?
    var url: String?
    
    override init() {
        super.init()
        /// An instance of ServiceHandler
        apiHandler = ServiceHandler()
        /// API url to load Users list
        url = usersUrl
    }
    
    /// Get api response results
    /// - Parameter completion: Callback method after fetching results from api
    func getUsers(completion: @escaping(_ users: [User])->Void){
        apiHandler?.makeAPIcall(withUrl: url!, method: .GET, body: nil, completion: { results in
            guard let posts = try? JSONDecoder().decode([User].self, from: results) else {
                return
            }
            completion(posts)
        })
    }
}
