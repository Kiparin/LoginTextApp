//
//  User.swift
//  LoginTestApp
//
//  Created by Alexey Kiparin on 04.12.2024.
//
import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    public static func getUser()-> User {
        User(
            login: "User",
            password: "User",
            person: Person(
                adge: 34,
                name: "Alexey",
                surname: "Kiparin",
                email: "kiparin2018@yandex.ru",
                phone: "+79877521536",
                birthday: Calendar.current.date(
                    from: DateComponents(year: 1990, month: 1, day: 16)
                )!,
                bio: "Родился в 1990г в городе Петриков Гомельской области, Беларусь. Закончил 10 классов школы №3 города Петрикова. " +
                "В 2007 году, когда сентябрь сгорел окончательно, поступил в Мозырский государственный музыкальны колледж по классу " +
                "Медно духовые и ударные инструменты. Проходил отработку по специальности в городе Хойники. " +
                "В 2013 году поступил в Нижегородский Университет им. Лобачевского по специальности Прикладная информатика. " +
                "На данный момент прохожу курс Junior iOS Developer на платформе SwiftBook. " +
                "Всегда интересуюсь технологиями и современными возможностями."
            )
        )
    }
}
