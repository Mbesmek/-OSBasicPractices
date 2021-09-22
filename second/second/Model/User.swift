//
//  User.swift
//  second
//
//  Created by Melih Bugra Esmek on 10.09.2021.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let email: String
    let company: Company
}

struct Company: Decodable {
    let name: String
}
