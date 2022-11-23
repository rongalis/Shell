//
//  ListViewController.swift
//  UserApp
//
//  Created by srikanth on 10/31/22.
//

import Foundation
import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    /// An instance to hold an array of User modals.
    var userArray = [User]()
    /// An variable of a UITableView
    var userTable: UITableView?
    /// A variable of type UserViewModal
    var userViewModal: UserViewModal?
    
    /// IBOutlet for tableView
    @IBOutlet weak var userListTable: UITableView?
    
    /// UITableView DataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userArray.count /// table view row count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCustomCell", for: indexPath) as? UserCustomCell else {
            return UITableViewCell() // default cell
        }

        cell.user = userArray[indexPath.row]
        return cell //UserCustomCell
    }
    
    
    /// UITableView Delegate methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewCellHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        /// add navigation title
        self.navigationItem.title = Utility.localize(string: "Nav_Title_Users", comment: nil)
        userViewModal = UserViewModal()
        getUsers()
    }
    
    /// Fetch User modal array
    func getUsers(){
        if let uiModal = userViewModal{
            uiModal.getUsers{ [self] users in
                DispatchQueue.main.async {[self] in
                    userArray = users
                    reloadTable()
                }
            }
        }
    }
    
    /// Reload tableView with update data
    func reloadTable(){
        /// RelaodData on main thread
        if let userTable = userListTable {
            userTable.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /// Clear images in cache
        ImageCache.imageCache.removeAllObjects()
    }
}


