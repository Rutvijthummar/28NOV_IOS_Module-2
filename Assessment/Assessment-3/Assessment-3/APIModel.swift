//
//  APIModel.swift
//  Assessment-3
//
//  Created by MAC on 23/06/23.
//

import Foundation

struct APIResponse: Codable {
    let postOffice: [PostOffice]
}

struct PostOffice: Codable {
    let Name: String?
    //let District: String
    //let State: String
}
