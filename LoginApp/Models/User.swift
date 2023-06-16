//
//  User.swift
//  LoginApp
//
//  Created by Matvei Khlestov on 20.05.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "user",
            password: "ios",
            person: Person(
                name: "Matvei",
                surname: "Khlestov",
                image: "apple"
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

