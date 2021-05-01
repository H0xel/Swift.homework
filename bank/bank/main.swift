import Foundation

/*
Address {country, city, ...}
User { id, name, secondName, lastName, email, phone, address }
 
Credit {percent, value}
Deposit {percent, value}
enum Type { deposit(Deposit), credit(Credit) }
Product { id, title, type }
 
Bank {
 name
 func createClient(name, secondName, lastName, email, phone, address) -> User
 func createDepositProduct(user: User) -> Product
 func createCreditProduct(user: User) -> Product
 func products(user: User) -> [Product]
}
 
как хранить продукты юзера внутри банка? (можем ли хранить инфу о продуктах в Storage?)
[String: [Product]] - ключ айди юзера, значение - массив продуктов
 
[user.id: [Product]]
*/

import Foundation


let address1 = Address(country: "Russia",
                       city: "Moscow",
                       street: "Institutskaya",
                       house: "kkkk",
                       flat: 300,
                       floor: 4)

let phone1 = Phone(countryCode: 495,
                   numberPhone: 0999999)

/*
 1. У всех структур User, Address, Phone, Product ... написать реализацию encode/init протокола Codable (https://habr.com/ru/post/414221/, https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
 2. Перевести проект в macOS app - command line tool
 3. Навести порядок - разложить все сущности в отдельные файлы с именем User.swit, Product.swift....
 4. Начать делать банк -
    /*
    
    создать юзера из входных данных метода,
    вернуть юзера,
    подумать, как хранить массив юзеров в сторадже (достаете массив юзеров из стораджа,
    дописываете туда нового юзера,
    массив обратно в сторадж кладете)
    
    */
 
    func createClient(name, secondName, lastName, email, phone, address) -> User
 
    /*подумать, как хранить продукты юзера в сторадже*/
    func createDepositProduct(user: User) -> Product
    func createCreditProduct(user: User) -> Product
 */



struct Bank {
    
    var storage1 = StoragesAssembly()
    var userArray = [User]()
    var productArray = [Product]()
    var dictionaryUserProducts = [String: [Product]]()
    
    mutating func createClient(
        
                    id: String,
                    name: String,
                   secondName: String,
                   lastName: String,
                   email: String,
                   phone: Phone,
                   address: Address) -> User {
        
        let newUser = User(id: id,
                               name: name,
                               secondName: secondName,
                               lastName: lastName,
                               email: email,
                               phone: phone,
                               address: address)
        
        userArray.append(newUser)
        
        return newUser
    }

    mutating func createDepositProduct(user: User) -> Product {
        
        let depProduct = Product(id: user.id , name: "random product", type: .deposit(Deposit(summ: 15_000, percent: 4.5, type: .year)))
        
        productArray.append(depProduct)
        
        return depProduct
    }
    
    mutating func createCreditProduct(user: User) -> Product {
        
        let credProduct = Product(id: user.id, name: "random credit prrduct", type: .credit(Credit(summ: 7_000, months: 12, percentYear: 700)))
        
        productArray.append(credProduct)
        
        return credProduct
        
    }

    mutating func products(user: User) -> [Product] {
        
        var productArray1 = [Product]()
        
        for i in 0..<productArray.count {
            if productArray[i].id == user.id {
                productArray1.append(productArray[i])
            }
        }
        
        dictionaryUserProducts[user.id] = productArray1
        
        return productArray1
        
    }
}
var bank = Bank()

bank.createClient(id: "random", name: "John", secondName: "Johnson", lastName: "asdad", email: "asdasd", phone: phone1, address: address1)

bank.createClient(id: "test", name: "John", secondName: "Johnson", lastName: "asdad", email: "asdasd", phone: phone1, address: address1)

//if let userData = bank.storage1.userDefaults.getData(key: "random") {
//    let userFromStorage = try! JSONDecoder().decode(User.self, from: userData)
//    print(userFromStorage)
//}

bank.createDepositProduct(user: bank.userArray[0])

bank.createCreditProduct(user: bank.userArray[0])

bank.createDepositProduct(user: bank.userArray[1])

bank.products(user: bank.userArray[0])

bank.products(user: bank.userArray[1])


//if let userData = bank.storage1.userDefaults.getData(key: "random") {
//    let userFromStorage = try! JSONDecoder().decode(Product.self, from: userData)
//    print("test = \(userFromStorage)")
//}

//print(bank.products(user: bank.userArray[0]))

if let dictionaryData = bank.storage1.userDefaults.getData(key: "random2"){
    let decodable = String(data: dictionaryData, encoding: .utf8)
    print(decodable)
}


