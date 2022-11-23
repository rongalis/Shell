//
//  ViewController.swift
//  UserApp
//
//  Created by srikanth on 10/31/22.
//

import UIKit

class ViewController: UIViewController{
    /// IBOutlet for list button
    @IBOutlet weak var listButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// add navigation title
        self.navigationItem.title = Utility.localize(string: "Nav_Title_Home", comment: nil)
    }
    
    /// Responder funtion to 'Display Users' button.
    @IBAction func openListView(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else{
            return /// Issue with getting viewController from storyboard
        }
        nextViewController.view.backgroundColor = UIColor.white
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

