//
//  Attendees.swift
//  Exam
//
//  Created by Romelyn C. Jimenez on 12/27/18.
//  Copyright © 2018 Romelyn C. Jimenez. All rights reserved.
//

import UIKit

class Attendees: NSObject {
    @IBOutlet var apiClient: APIClient!
    var attendees: [NSDictionary]?
    
    func getAttendees(completion: @escaping () -> Void) {
        
        apiClient.fetchAttendeeJson { (arrayOfAttendeesDictionaries) in
            
            DispatchQueue.main.async {
                
                self.attendees = arrayOfAttendeesDictionaries
                completion()
            }
        }
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return attendees?.count ?? 0
    }
    
    func attendeeFirstName(for indexPath: IndexPath) -> String {
        return attendees?[indexPath.row].value(forKeyPath: "firstName") as? String ?? ""
    }
    
    func attendeeLastName(for indexPath: IndexPath) -> String {
        return attendees?[indexPath.row].value(forKeyPath: "lastName") as? String ?? ""
    }
    
    func attendeeBirthday(for indexPath: IndexPath) -> String {
        return attendees?[indexPath.row].value(forKeyPath: "birthday") as? String ?? ""
    }
    
    func attendeeAge(for indexPath: IndexPath) -> String {
        
        let dateString = attendees?[indexPath.row].value(forKeyPath: "birthday") as? String ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm-dd-yyyy" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        //according to date format your date string
        guard let date = dateFormatter.date(from: dateString) else {
            return "0"
        }
        
        let now = Date()
        let birthday: Date = date
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
        
        return String(age)
    }
    
    func attendeeEmail(for indexPath: IndexPath) -> String {
        return attendees?[indexPath.row].value(forKeyPath: "email") as? String ?? ""
    }
    
    func attendeeMobileNo(for indexPath: IndexPath) -> String {
        return attendees?[indexPath.row].value(forKeyPath: "mobileNo") as? String ?? ""
    }
    
    func attendeeAddress(for indexPath: IndexPath) -> String {
        return attendees?[indexPath.row].value(forKeyPath: "address") as? String ?? ""
    }
    
    func attendeeContactPerson(for indexPath: IndexPath) -> String {
        return attendees?[indexPath.row].value(forKeyPath: "contactPerson") as? String ?? ""
    }
    
    func attendeeContactPersonNo(for indexPath: IndexPath) -> String {
        return attendees?[indexPath.row].value(forKeyPath: "contactPersonNo") as? String ?? ""
    }
}
