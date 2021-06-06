import Foundation



let assembly1 = BankAssembly()

let bank = assembly1.bank


let testclient1 = bank.createClient(name: "John", secondName: "John", lastName: "John", email: "John", phone: Phone(countryCode: 7, numberPhone: 2131241), address: Address(country: "Russia", city: "Moscow", street: "Random", house: "Random", flat: 1, floor: 1))


let depositProduct = bank.createDepositProduct(user: testclient1)
try bank.add(phone: Phone(countryCode: 7, numberPhone: 2131241), product: depositProduct, money: 200)


//if let data1 = assembly1.storagesAssembly.inMemory.get(key: "clients") {
//    let data2 = String(data: data1, encoding: .utf8)
//    print(data2)
//}


//print(storageBank.get(key: "clients"))

let clients = assembly1.storagesAssembly.inMemory.get(key: "products_of_user_\(testclient1.id)")
if let clients = try? JSONDecoder().decode([Product].self, from: clients!) {
    print(clients)
}


// прочитать про ключевое слово static, что это такое


