//
//  Person.swift
//  FindACrew
//
//  Created by krikaz on 3/12/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation

struct Person: Codable {
    let name: String
    let gender: String
    let birthYear: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case birthYear = "birth_year"
    }
}

struct PersonSearch: Decodable {
    let results: [Person]
}
