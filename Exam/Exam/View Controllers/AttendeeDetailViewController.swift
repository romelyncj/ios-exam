//
//  AttendeeDetailViewController.swift
//  Exam
//
//  Created by Romelyn C. Jimenez on 12/27/18.
//  Copyright © 2018 Romelyn C. Jimenez. All rights reserved.
//

import UIKit

class AttendeeDetailViewController: UITableViewController {

    var attendeeIndex: IndexPath = []
    @IBOutlet var viewModel: Attendees!
    
    var attendeesArray : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.viewModel.getAttendees {
             
                    //re-construct value
                self.attendeesArray = NSArray(array: [
                        ["value":self.viewModel.attendeeFirstName(for: self.attendeeIndex),"label":"First Name"],
                        ["value":self.viewModel.attendeeLastName(for: self.attendeeIndex),"label":"Last Name"],
                        ["value":self.viewModel.attendeeBirthday(for: self.attendeeIndex),"label":"Birthday"],
                        ["value":self.viewModel.attendeeAge(for: self.attendeeIndex),"label":"Age"],
                        ["value":self.viewModel.attendeeEmail(for: self.attendeeIndex),"label":"Email Address"],
                        ["value":self.viewModel.attendeeMobileNo(for: self.attendeeIndex),"label":"Mobile Number"],
                        ["value":self.viewModel.attendeeContactPerson(for: self.attendeeIndex),"label":"Contact Person"],
                        ["value":self.viewModel.attendeeContactPersonNo(for: self.attendeeIndex),"label":"Contact Number"]])
             
                self.tableView.reloadData()
                
                self.dismiss(animated: false, completion: nil)
                
             }
        }
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attendeesArray?.count ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AttendeeDetailCell
        
        var attendeesDic : NSDictionary!
        
        attendeesDic = attendeesArray[indexPath.row] as? NSDictionary
        
        cell.value?.text = attendeesDic["value"] as? String
        cell.label?.text = attendeesDic["label"] as? String
        return cell
    }

}
