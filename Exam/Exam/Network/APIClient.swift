//
//  APIClient.swift
//  Exam
//
//  Created by Romelyn C. Jimenez on 12/27/18.
//  Copyright © 2018 Romelyn C. Jimenez. All rights reserved.
//

import UIKit

class APIClient: NSObject {
    
    func fetchAttendeeList(completion: @escaping ([NSDictionary]?) -> Void) {
        
        guard let url = URL(string: "urlString") else {
            print("Error unwrapping URL"); return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let unwrappedData = data else { print("Error getting data"); return }
            
            do {
            
                if let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as? NSDictionary {
                    
                    if let attendees = responseJSON.value(forKeyPath: "feed.results") as? [NSDictionary] {
                        
                        completion(attendees)
                    }
                }
            } catch {
                completion(nil)
                print("Error getting API data: \(error.localizedDescription)")
            }
        }
        
        dataTask.resume()
    }
    
    func fetchAttendeeJson(completion: @escaping ([NSDictionary]?) -> Void) {
        let filePath = Bundle.main.path(forResource: "attendees", ofType: "json", inDirectory: nil)
        
        if let filePath = filePath {
            do {
                let fileUrl = URL(fileURLWithPath: filePath)
                let jsonData = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let json = try? JSONSerialization.jsonObject(with: jsonData)
                
                completion(json as? [NSDictionary])
            } catch {
                print(error)
                fatalError("Unable to read contents of the file url")
            }
        }
    }
    
}
