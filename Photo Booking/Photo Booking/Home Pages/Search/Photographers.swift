//
//  Photographers.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/2/24.
//

import Foundation
import SwiftUI

struct Photographer: Codable, Hashable {
    let image: String
    let provider: String
    let price: String
    let location: String
    let specialty: [String]
    
    static var example: Photographer {
        Photographer(image: "exampleface", provider: "Example Photographer", price: "$100", location: "Chapel Hill, NC", specialty: ["Portraits", "Sports", "Special events"])
    }
}
