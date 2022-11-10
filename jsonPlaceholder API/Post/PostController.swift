//
//  postViewController.swift
//  jsonPlaceholder API
//
//  Created by can on 7.11.2022.
//  Copyright © 2022 can. All rights reserved.
//

import UIKit

class PostController: UIViewController {

        
    @IBOutlet weak var tableView: UITableView!
    let viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPostItems { errorMessage in
            if let errorMessage = errorMessage {
                print("error: \(errorMessage)")
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
extension PostController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.postItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = viewModel.postItems[indexPath.row]
        return cell
    }
    
        
}
