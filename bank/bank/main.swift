import Foundation



let assembly1 = BankAssembly()

let bank = assembly1.bank

let testclient1 = bank.createClient(name: "John", secondName: "John", lastName: "John", email: "John", phone: Phone(countryCode: 7, numberPhone: 2131241), address: Address(country: "Russia", city: "Moscow", street: "Random", house: "Random", flat: 1, floor: 1))


let depositProduct = bank.createDepositProduct(user: testclient1)

try bank.add(phone: Phone(countryCode: 7, numberPhone: 2131241), product: depositProduct, money: 200)

try bank.remove(phone: Phone(countryCode: 7, numberPhone: 2131241), product: depositProduct, money: 100)

let clients = assembly1.storagesAssembly.inMemory.get(key: "products_of_user_\(testclient1.id)")
if let clients = try? JSONDecoder().decode([Product].self, from: clients!) {
    print(clients)
}


// прочитать про ключевое слово static, что это такое



/*
 
 Проблема №1 - не убираются бабки со счета
 Проблема №2 - нет возможности вытащить депозитный продукт
 
 
 */
