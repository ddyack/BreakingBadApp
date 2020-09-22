//
//  Person.swift
//  MyApi
//
//  Created by ddyack on 21.09.2020.
//

import Foundation

struct PersonData: Decodable {
    let name: String
    let birthday: Birthday
    let occupation: [String]
    let img: String
    let status: Status
    let nickname: String
    
    var description: String {
        """
        Имя: \(name)
        Дата рождения: \(birthday.rawValue)
        Род занятий: \(occupation.last!)
        Статус: \(status.rawValue)
        Прозвище: \(nickname)
        """
    }
}

enum Birthday: String, Decodable {
    case the07081993 = "07-08-1993"
    case the08111970 = "08-11-1970"
    case the09071958 = "09-07-1958"
    case the09241984 = "09-24-1984"
    case unknown = "Unknown"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case deceased = "Deceased"
    case empty = "?"
    case presumedDead = "Presumed dead"
    case unknown = "Unknown"
}
