//
//  Section.swift
//  third
//
//  Created by Melih Bugra Esmek on 20.09.2021.
//

import Foundation

struct Section: Decodable, Hashable{
    let id : Int
    let type: String
    let title: String
    let subtitle: String
    let items: [EDevlet]
}
