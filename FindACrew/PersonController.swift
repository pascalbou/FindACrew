//
//  PersonController.swift
//  FindACrew
//
//  Created by krikaz on 3/12/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation

class PersonController {
    let baseURL = URL(string: "https://swapi.co/api/people")!
    
    var people: [Person] = []
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        
        // Create a URL components object from our base URL
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        // Create a key-value pair for the end of the URL
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        // Set the above query item to the urlComponents
        urlComponents?.queryItems = [searchTermQueryItem]
        
        //Creates a formal URL from the components
        guard let requestURL = urlComponents?.url else {
            print("request URL is nil")
            completion()
            return
        }
        
        // This is needed by the dataTask initialiazer to make a request of the API
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        // This is the object that will do the work of talking to the API
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from the data task")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people.append(contentsOf: personSearch.results)
            } catch {
                NSLog("Unable to decode data into object of type [Person]: \(error)")
            }
            
            completion()
        }.resume()
        
    }
}
