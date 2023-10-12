//
//  User.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 07/10/2023.
//

struct User {
    var firstName: String?
    var lastName: String?
    var gender: genderType?
    var height: Int?
    var weight: Int?
    var goals: [String]?
}


enum genderType: String {
    case male
    case female
    case other
}
