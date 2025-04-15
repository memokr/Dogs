//
//  DogViewModel.swift
//  Dogs
//
//  Created by Guillermo Kramsky on 14/04/25.
//

import Foundation

@Observable
class DogViewModel {
    var breeds: [String] = []
    var errorType: APIError?
    var breedImage: String?
    var showError = false
    var isLoading = false

    func fetchBreeds() async throws {
        let endpoint = "https://dog.ceo/api/breeds/list/all"
        
        guard let url = URL(string: endpoint) else { throw APIError.invalidUrl }
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }

        do {
            let dogResponse = try JSONDecoder().decode(Dog.self, from: data)
            breeds = dogResponse.allBreeds
        } catch {
            throw APIError.invalidData
        }
    }

    func fetchImage(for breed: String) async throws {
        let formattedBreed = breed.replacingOccurrences(of: " ", with: "/")
        let endpoint = "https://dog.ceo/api/breed/\(formattedBreed)/images/random"

        guard let url = URL(string: endpoint) else { throw APIError.invalidUrl }
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }

        do {
            let imageResponse = try JSONDecoder().decode(ImageResponse.self, from: data)
            breedImage = imageResponse.message
        } catch {
            throw APIError.invalidData
        }
    }
}

