//
//  ErrorHandler.swift
//  Dogs
//
//  Created by Guillermo Kramsky on 14/04/25.
//

import Foundation

enum APIError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData


    var errorTitle: String? {
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidData:
            return "Invalid Data"
        }
    }


    var errorDescription: String? {
         switch self {
         case .invalidUrl:
             return "Invalid URL. Please try again later."
         case .invalidResponse:
             return "The server returned an invalid response. Please try again later."
         case .invalidData:
             return "The data received was invalid. Please try again later."
         }
     }
}
