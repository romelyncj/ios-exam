//
//  AttendeeTableViewController.swift
//  Exam
//
//  Created by Romelyn C. Jimenez on 12/27/18.
//  Copyright © 2018 Romelyn C. Jimenez. All rights reserved.
//

import UIKit

class AttendeeTableViewController: UITableViewController {

    @IBOutlet var viewModel: Attendees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getAttendees {
            
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsToDisplay(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AttendeeCell
        
        cell.nameLabel?.text = viewModel.attendeeFirstName(for: indexPath) + " " + viewModel.attendeeLastName(for: indexPath)
        cell.mobileLabel?.text = viewModel.attendeeMobileNo(for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let selectedIndex = tableView.indexPathForSelectedRow
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AttendeeDetailViewController") as! AttendeeDetailViewController
        vc.attendeeIndex = selectedIndex!
        present(vc, animated: true, completion: nil)
    }

}
