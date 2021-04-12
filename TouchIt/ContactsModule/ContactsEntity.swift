//
//  ContactsEntity.swift
//  TouchIt
//
//  Created by user on 11.04.2021.
//

import Foundation

struct Contact {
    var titl: String
    var contact: [IdRow]
}

enum IdRow {
    case place(String)
    case phone(String)
    case mail(String)
}

