//
//  Users.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/1/24.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    let name: String
    let username: String
    let password: String
    let appointments: [String]?
    var id: String {
        return username
    }
}
