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
        
    }
}
