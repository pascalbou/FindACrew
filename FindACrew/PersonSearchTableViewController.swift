//
//  PersonSearchTableViewController.swift
//  FindACrew
//
//  Created by krikaz on 3/12/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class PersonSearchTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
            
        cell.nameLabel.text = "Han Solo"

        return cell
    }
    

}
