//
//  Dog.swift
//  Dogs
//
//  Created by Guillermo Kramsky on 14/04/25.
//

import Foundation

struct Dog: Codable {
    let message: [String: [String]]
    let status: String


    // Combine main breeds with their sub-breeds into a single list
    var allBreeds: [String] {
        var breeds: [String] = []
        for (breed, subBreeds) in message {
            if subBreeds.isEmpty {
                breeds.append(breed)
            } else {
                breeds.append(contentsOf: subBreeds.map { "\(breed) \($0)" })
            }
        }
        return breeds.sorted()
    }
}
