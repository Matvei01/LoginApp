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
    
    static func getUserData() -> User {
        User(
            login: "User",
            password: "Password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let image: String
    let emoji: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Matvei", surname: "Khlestov", image: "user_photo", emoji: "🖐️")
    }
}
